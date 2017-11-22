class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :material_name
      t.integer :project_id
    end
  end
end
