class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.integer :conference_id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
