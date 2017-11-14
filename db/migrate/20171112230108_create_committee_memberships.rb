class CreateCommitteeMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :committee_memberships do |t|
      t.references :committee, foreign_key: true
      t.references :legislator, foreign_key: true
      t.string :position

      t.timestamps
    end
  end
end
