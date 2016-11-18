class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :read, :update, :destroy, :to => :owncrud

    if user.has_role? :publisher
      can :owncrud, User do |user|
        user.try(:owner) == user
      end

      can :manage, Aviso do |aviso|
        aviso.try(:owner) == user
      end

      can :communicate, Aviso

    elsif user.has_role? :hunter
      can :owncrud, User do |user|
        user.try(:owner) == user
      end

      can :read, Aviso
      can :communicate, Aviso
    else
      can :read, Aviso
    end

    # Para checkear si un usuario tiene cierto role
    # Ejecturar
    # <% if @user.has_role? :publisher %>
  end
end
