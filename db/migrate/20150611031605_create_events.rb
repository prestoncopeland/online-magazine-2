class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.string :category
      t.string :address
      t.string :city
      t.string :state
      t.string :telephone
      t.string :email

      t.timestamps null: false
    end
  end
end
