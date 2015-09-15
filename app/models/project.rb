class Project < ActiveRecord::Base
  has_many :developers
  has_many :tickets

  def self.search(query)
  	dquery = "%#{query.to_s.downcase}%"
  	begin
  		# Attempt to parse query as an Integer.  If this fails, then it
  		# will raise an ArgumentError
  		iquery = Integer(query)
	rescue ArgumentError
		where('LOWER(project_name) LIKE ?', dquery)
	else
		where('LOWER(project_name) LIKE ? OR project_id = ?', dquery, iquery)
	end
  end
end
