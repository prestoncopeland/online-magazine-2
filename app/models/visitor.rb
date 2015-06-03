class Visitor < ActiveRecord::Base

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  after_create :subscribe

  def subscribe
    mailchimp = Gibbon::API.new(Rails.application.secrets.mailchimp_api_key)
    result = mailchimp.lists.subscribe({
:id => "ba7cde17a3",
:email => {:email => self.email},
:merge_vars => {'FNAME' => self.first_name,
                                   'LNAME' => self.last_name},
:double_optin => false,
:update_existing => true,
:send_welcome => true
    })
    Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
  end



end
