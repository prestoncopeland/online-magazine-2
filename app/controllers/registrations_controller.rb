class RegistrationsController < Devise::RegistrationsController


  def create
    build_resource(sign_up_params)
    resource.role = User.roles[:subscribed] unless resource.admin?
    resource.stripeToken = params[:stripeToken]
    pay_with_card
    resource.save

    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
         respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      render json:
        {error: resource.errors.full_messages.to_sentence},
        status: 400
    end
  end

  private


  def sign_up_params
    params.require(:user).permit(:email,
    :password, :password_confirmation, :first_name, :last_name, :addressee, :address_line_1, :address_line_2, :city, :state, :zip_code, :country)
  end

  def pay_with_card

    customer = Stripe::Customer.create(
      :email => params[:user][:email],
      :card  => params[:stripeToken]
    )
    price = Rails.application.secrets.product_price
    title = Rails.application.secrets.product_title
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => "#{price}",
      :description => "#{title}",
      :currency    => 'usd'
    )
    Rails.logger.info("Stripe transaction for #{resource.email}") if charge[:paid] == true
    rescue Stripe::InvalidRequestError => e
    resource.errors[:base] << e.message
    rescue Stripe::CardError => e
    resource.errors[:base] << e.message
  end

end