class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :stripe_id
      t.string :interval
      t.integer :interval_count
      t.integer :amount

      t.timestamps null: false
    end
  end
end
