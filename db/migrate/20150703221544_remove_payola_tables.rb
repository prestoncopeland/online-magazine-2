class RemovePayolaTables < ActiveRecord::Migration
  def change
    remove_index :users, column: :plan_id
    remove_column :users, :plan_id, :integer
    drop_table :plans
    remove_index :payola_subscriptions, column: :guid
    drop_table :payola_subscriptions
    drop_table :payola_stripe_webhooks
    drop_table :payola_sales
    drop_table :payola_affiliates
    drop_table :payola_coupons
  end
end
