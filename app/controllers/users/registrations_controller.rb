class Users::RegistrationsController < Devise::RegistrationsController
include RackSessionsFix
  respond_to :json
  private
  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end
  def register_success
    render json: { message: 'Signed up.' }
  end
  def register_failed
    render json: { message: "Signed up failure." }
  end
end