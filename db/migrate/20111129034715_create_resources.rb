class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :model
      t.integer :cost
      t.float :lat
      t.float :lon
      t.references :user
      t.references :esf
      t.references :costperitem

      t.timestamps
    end
    add_index :resources, :user_id
    add_index :resources, :esf_id
    add_index :resources, :costperitem_id
  end
end
