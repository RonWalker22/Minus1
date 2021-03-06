class CreateModes < ActiveRecord::Migration[5.2]
  def change
    create_table :modes do |t|
      t.references :game, null:false
      t.string :name, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :modes, [:name, :game_id], unique: true
  end
end
