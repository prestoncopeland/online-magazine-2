class AddCategoryToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :category, :integer, default: 0
  end
end
