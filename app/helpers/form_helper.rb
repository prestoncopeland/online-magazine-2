module FormHelper

  def setup_article(article)
    2.times { article.photos.build }
    article
  end

end