class TicketsController <ApplicationController
before_action :authenticate_user!

  def index
    if params[:search]
      @tickets = Ticket.search(params[:search])
    else
      @tickets = Ticket.all
    end
  end

  def show
    @ticket = Ticket.find params[:id]
  end
end