class User < ActiveRecord::Base

  enum role: [:user, :admin, :subscribed]
  after_initialize :set_default_role, :if => :new_record?
  after_initialize :set_default_plan, :if => :new_record?
  # after_create :sign_up_for_mailing_list

  validates :first_name, :last_name, :email, :addressee, :address_line_1, :city, :state, :zip_code, :country, presence: true

  belongs_to :plan
  validates_associated :plan


  def set_default_role
    self.role ||= :user
  end

  def set_default_plan
    self.plan ||= Plan.first
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
