class CreateCapabilities < ActiveRecord::Migration
  def change
    create_table :capabilities do |t|
      t.references :resource
      t.string :capability

      t.timestamps
    end
    add_index :capabilities, :resource_id
  end
end
