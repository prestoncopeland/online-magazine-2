class ContentController < ApplicationController
  before_action :authenticate_user!

  def subscribed
    redirect_to root_path, :notice => "Access denied." unless current_user.subscribed?
  end
end
