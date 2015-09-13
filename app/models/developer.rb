class Developer < ActiveRecord::Base
  has_many :tickets 
  has_many :projects
end
