class AddLastNameToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :last_name, :string
  end
end
