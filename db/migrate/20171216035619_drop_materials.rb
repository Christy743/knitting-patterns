class DropMaterials < ActiveRecord::Migration
  def change
    drop_table :materials
  end
end
