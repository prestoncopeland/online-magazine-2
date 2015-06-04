class ArticlesController < ApplicationController

  def sort
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @photos = @article.photos
  end

  def new
    @article = Article.new
    2.times { @article.photos.build}
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "Article '#{@article.title}' created!"
      redirect_to article_path(@article)
    else
      render :action => 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
    2.times { @article.photos.build}
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' updated!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' deleted!"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :author, :body, :tag_list, :category, photos_attributes:[:photo_id, :caption, :photo, :done, :_destroy])
  end


end
