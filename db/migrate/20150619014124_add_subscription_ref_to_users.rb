class AddSubscriptionRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :subscription, index: true, foreign_key: true
  end
end
