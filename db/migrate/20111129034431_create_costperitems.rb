class CreateCostperitems < ActiveRecord::Migration
  def change
    create_table :costperitems do |t|
      t.string :item

      t.timestamps
    end
  end
end
