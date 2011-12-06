class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :incident
      t.references :resource
      t.string :status

      t.timestamps
    end
    add_index :requests, :incident_id
    add_index :requests, :resource_id
  end
end
