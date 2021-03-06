class CreateStrategies < ActiveRecord::Migration[5.2]
  def change
    create_table :strategies do |t|
      t.references :commander,
                   foreign_key: { to_table: :users },
                   null: false
      t.references :mode
      t.references :level
      t.references :game
      t.integer :assignment_flow, array: true, default: []
      t.references :inspiration, foreign_key: { to_table: :strategies }
      t.string :name, null: false
      t.boolean :private, default: false, null: false
      t.boolean :natural_flow, default: true, null: false
      t.uuid :uuid
      t.string :version, default: '0z', null:false
      t.timestamps
    end
  end
end
