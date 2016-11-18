class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # Less code, more functionality
  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user)

        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
    }
  end

  # Agregar otros proveedores cuando se habilitan
  # No olvidar usar gem correspondiente
  [:twitter, :facebook, :linked_in].each do |provider|
    provides_callback_for provider
  end

  # Usuario se logea o crea una cuenta nueva por API
  # Luego se lo obliga a finalizar registro
  # Indicando el email y seleccionar tipo de cuenta
  # Tiene que se de esta manera ya que no todas las APIs permite accesso
  # a datos como email
  def after_sign_in_path_for(resource)
    if resource.email_verified?
      super resource
    else
      finish_signup_path(resource)
    end
  end
end
