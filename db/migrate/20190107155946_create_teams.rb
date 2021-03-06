class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.references :commander,
                   foreign_key: { to_table: :users },
                   null: false
      t.string :password

      t.timestamps
    end
  end
end
