class User < ActiveRecord::Base

  enum role: [:user, :admin, :subscribed]
  after_initialize :set_default_role, :if => :new_record?
  # after_create :sign_up_for_mailing_list

  attr_accessor :stripeToken

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, :addressee, :address_line_1, :city, :state, :zip_code, :country, presence: true

  def set_default_role
    self.role ||= :user
  end

end

