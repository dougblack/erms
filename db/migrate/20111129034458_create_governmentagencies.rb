class CreateGovernmentagencies < ActiveRecord::Migration
  def change
    create_table :governmentagencies do |t|
      t.string :username
      t.string :jurisdiction

      t.timestamps
    end
  end
end
