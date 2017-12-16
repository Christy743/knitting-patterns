class AddMaterialsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :materials, :string
  end
end
