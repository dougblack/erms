class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.datetime :this_date
      t.string :description
      t.float :lat
      t.float :lon
      t.references :user
      t.timestamps
    end
  end
end
