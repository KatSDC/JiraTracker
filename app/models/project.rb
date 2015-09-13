class Project < ActiveRecord::Base
  has_many :developers
  has_many :tickets
end
