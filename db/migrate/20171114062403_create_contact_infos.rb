class CreateContactInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_infos do |t|
      t.string :fax
      t.string :phone
      t.string :facebook
      t.string :twitter
      t.string :youtube
      t.references :legislator, foreign_key: true

      t.timestamps
    end
  end
end
