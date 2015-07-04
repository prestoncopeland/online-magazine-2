class VisitorsController < ApplicationController
  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(params.require(:visitor).permit(:first_name, :last_name, :email))
    if @visitor.save
      MailingListSignupJob.perform_later @visitor
      redirect_to root_path, notice: "Signed up #{@visitor.email}."
    else
      render :new
    end
  end

end

