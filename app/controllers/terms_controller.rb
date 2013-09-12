class TermsController < ApplicationController
  def new
    @term = Term.new
  end
  
  def create
    @term = @feed.new_term(params[:term])
    if @term.publish
      flash[:notice] = "Added new term"
      redirect_to home_path
    else
      render :action => :new
    end
  end
end
