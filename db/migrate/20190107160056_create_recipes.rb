class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.references :objective, null: false
      t.references :commander,
                   foreign_key: { to_table: :operators },
                   null: false
      t.timestamps
    end
  end
end