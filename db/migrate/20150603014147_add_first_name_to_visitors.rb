class AddFirstNameToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :first_name, :string
  end
end
