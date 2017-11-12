class CreateLegislators < ActiveRecord::Migration[5.1]
  def change
    create_table :legislators do |t|
      t.string :firstname
      t.string :lastname
      t.string :bioguide_id
      t.string :state
      t.string :district
      t.string :chamber
      t.datetime :next_update, null: false

      t.timestamps
    end
    add_index :legislators, :bioguide_id
    add_index :legislators, :state
    add_index :legislators, :district
  end
end
