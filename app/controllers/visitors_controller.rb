class VisitorsController < ApplicationController

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(params.require(:visitor).permit(:email, :name))
    if @visitor.save
      redirect_to root_path, notice: "Signed up #{@visitor.name}."
    else
      render :new
    end
  end

end
