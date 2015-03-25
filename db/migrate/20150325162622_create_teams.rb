class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :division_id, null: false
      t.string :logo

      t.timestamps
    end
  end
end
