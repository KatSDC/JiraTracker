class ProjectsController < ApplicationController
before_action :authenticate_user!

  def index
    if params[:search]
      @projects = Project.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
    else
      @projects = Project.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @project = Project.find params[:id]
    @tickets = Ticket.all    
  end

end