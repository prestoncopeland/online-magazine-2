class RemovePayolaTables < ActiveRecord::Migration
  def change
    remove_index :users, column: :plan_id
    remove_column :users, :plan_id, :integer
    drop_table :plans
  end
end
