class Committee < ApplicationRecord
  has_many :subcommittees, class_name: 'Committee',
                           foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Committee', optional: true

  validates_presence_of :chamber, :code, :name
end
