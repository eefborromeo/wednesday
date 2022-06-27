class ConfirmationsController < Devise::ConfirmationsController
  private

  def after_confirmation_path_for(resourece_name, resource)
    sign_in(resource)
    root_path
  end
end