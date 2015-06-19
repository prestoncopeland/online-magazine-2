class ChangeOldSubscriptionColumnsAndIndices < ActiveRecord::Migration
  def change
    remove_index(:users, :subscription_id)
    add_reference(:users, :plan, index: true, foreign_key: true)
  end
end
