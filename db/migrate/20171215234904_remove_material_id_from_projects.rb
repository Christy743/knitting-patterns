class RemoveMaterialIdFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :material_id, :integer
  end
end
