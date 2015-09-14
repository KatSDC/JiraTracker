class TicketsController <ApplicationController
before_action :authenticate_user!
require 'will_paginate/array'

  def index
    if params[:search]
      @tickets = Ticket.search(params[:search])
    else
      @tickets = Ticket.all
    end
    @tickets = Ticket.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @ticket = Ticket.find params[:id]
  end
end