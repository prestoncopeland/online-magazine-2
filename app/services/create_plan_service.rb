class CreatePlanService

  def call
  p1 = Plan.where(name: 'Subscribed').first_or_initialize do |p|
      p.amount = 1000
      p.interval = 'month'
      p.interval_count = 2
      p.stripe_id = 'subscribed'
    end
    p1.save!(:validate => false)
  end

end