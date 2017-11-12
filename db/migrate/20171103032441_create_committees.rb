class CreateCommittees < ActiveRecord::Migration[5.1]
  def change
    create_table :committees do |t|
      t.string :name
      t.references :parent, index: true
      t.string :chamber
      t.string :code
      t.integer :parent_id
      t.string :url

      t.timestamps
    end
    add_index :committees, :code
  end
end
