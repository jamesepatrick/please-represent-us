class UniqueBioguide < ActiveRecord::Migration[5.1]
  def change
    remove_index :legislators, :bioguide_id
    add_index :legislators, :bioguide_id, unique: true
  end
end
