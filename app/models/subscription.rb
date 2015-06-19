class Subscription < ActiveRecord::Base
   include Payola::Plan

  has_many :users
  validates :stripe_id, inclusion: { in: Subscription.pluck('DISTINCT stripe_id'),
      message: "not a valid subscription plan" }

  def redirect_path(subscription)
    '/'
  end

end
