class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, null: false, unique: true
      t.string :position
      t.integer :team_id

      t.timestamps
    end
  end
end
