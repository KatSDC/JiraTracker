class TicketsController <ApplicationController
before_action :authenticate_user!

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find params[:id]
  end
end