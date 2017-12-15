class Material < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  has_many :projects, through: :users


end
