class User < ActiveRecord::Base

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_initialize :set_default_subscription, :if => :new_record?
  # after_create :sign_up_for_mailing_list

  belongs_to :subscription
  validates_associated :subscription


  def set_default_role
    self.role ||= :user
  end

  def set_default_subscription
    self.subscription ||= Subscription.first
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
