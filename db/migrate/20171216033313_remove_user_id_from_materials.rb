class RemoveUserIdFromMaterials < ActiveRecord::Migration
  def change
    remove_column :materials, :user_id, :integer
  end
end
