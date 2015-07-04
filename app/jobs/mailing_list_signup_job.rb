class MailingListSignupJob < ActiveJob::Base

  def perform(user)
    mailchimp = Gibbon::API.new(Rails.application.secrets.mailchimp_api_key)
    result = mailchimp.lists.subscribe({
:id => "ba7cde17a3",
:email => {:email => user.email},
:merge_vars => {'FNAME' => user.first_name,
                                   'LNAME' => user.last_name},
:double_optin => false,
:update_existing => true,
:send_welcome => true
    })
    Rails.logger.info("Subscribed #{user.email} to MailChimp") if result
  end

end
