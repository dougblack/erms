class CreateAddesfs < ActiveRecord::Migration
  def change
    create_table :addesfs do |t|
      t.references :resource
      t.references :esf

      t.timestamps
    end
    add_index :addesfs, :resource_id
    add_index :addesfs, :esf_id
  end
end
