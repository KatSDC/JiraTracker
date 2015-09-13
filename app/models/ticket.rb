class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :developer

  def index
    @tickets = Ticket.paginate(:page => params[:page], :per_page => 10)
  end

    def self.search(query)
    where('title LIKE :query OR ticket_id LIKE :query', query: "%#{query}%")
  end
end
