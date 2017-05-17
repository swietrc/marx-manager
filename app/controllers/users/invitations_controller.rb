class Users::InvitationsController < Devise::InvitationsController
  before_action :permit_params, if: :devise_controller?

  def update
    super do |u|
      u.approved = true
    end
  end

  protected
    def permit_params
      devise_parameter_sanitizer.permit(:invite) do |u|
        u.permit(:email, :last_name, :first_name)
      end
    end
end