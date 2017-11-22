class Project < ActiveRecord::Base
  has_many :materials
  belongs_to :user

  validates_presence_of :directions
end
