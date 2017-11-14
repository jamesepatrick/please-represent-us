class AddUniqConstaintOnCommitteeCode < ActiveRecord::Migration[5.1]
  def change
    remove_index :committees, :code
    add_index :committees, :code, unique: true
  end
end
