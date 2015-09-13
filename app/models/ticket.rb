class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :developer

  def index
    @tickets = Ticket.paginate(:page => params[:page], :per_page => 10)
  end
end
