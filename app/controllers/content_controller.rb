class ContentController < ApplicationController
  before_action :authenticate_user!

  def premium
    redirect_to root_path, :notice => "Access denied." unless current_user.user?
  end
end
