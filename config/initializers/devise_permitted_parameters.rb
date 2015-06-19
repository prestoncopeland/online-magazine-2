module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :addressee << :address_line_1 << :address_line_2 << :city << :state << :zip_code << :country
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :addressee << :address_line_1 << :address_line_2 << :city << :state << :zip_code << :country
  end

end

DeviseController.send :include, DevisePermittedParameters
