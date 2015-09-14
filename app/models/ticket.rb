class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :developer

  def index
    @tickets = Ticket.all
  end

  def self.search(query)
  	dquery = "%#{query.to_s.downcase}%"
  	begin
  		# Attempt to parse query as an Integer.  If this fails, then it
  		# will raise an ArgumentError
  		iquery = Integer(query)
	rescue ArgumentError
		where('LOWER(title) LIKE ?', dquery)
	else
		where('LOWER(title) LIKE ? OR ticket_id = ?', dquery, iquery)
	end
  end
end
