class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|
      t.string :username
      t.integer :population

      t.timestamps
    end
  end
end
