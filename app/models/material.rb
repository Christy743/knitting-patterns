class Material < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  has_many :projects, through: :users

  def self.valid_params?(params)
    return !params[:material_name].empty?
  end
end
