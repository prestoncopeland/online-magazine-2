class CreateSubscriptionService

  def call
  p1 = Subscription.where(name: 'Initials Magazine Subscriber').first_or_initialize do |p|
      p.amount = 1000
      p.interval = 'month'
      p.interval_count = 2
      p.stripe_id = 'user'
    end
    p1.save!(:validate => false)
  end

end