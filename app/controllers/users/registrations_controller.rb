class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(sign_up_params)

    respond_to do |format|
      if @user.save

        if params[:user][:roles] == "publisher"
          @user.add_role :publisher
        else
          @user.add_role :hunter
        end
        @user.save

        # Logear usuario despues de crear registro nuevo
        sign_in(@user, :bypass => true)

        format.html { redirect_to @user, notice: 'La cuenta ya esta lista para usar.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

private

  def sign_up_params
    params.require(:user).permit( :email, :password, :password_confirmation , :name, :phone, :location)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password , :role, :name, :phone, :location)
  end
end
