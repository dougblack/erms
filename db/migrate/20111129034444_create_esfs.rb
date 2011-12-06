class CreateEsfs < ActiveRecord::Migration
  def change
    create_table :esfs do |t|
      t.string :description

      t.timestamps
    end
  end
end
