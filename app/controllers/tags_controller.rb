class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    flash.notice = "Category '#{@tag.name}' updated!"
    redirect_to tag_path(@tag)
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash.notice = "Category '#{@tag.name}' deleted!"
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
