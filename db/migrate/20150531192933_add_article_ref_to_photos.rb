class AddArticleRefToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :article, index: true, foreign_key: true
  end
end
