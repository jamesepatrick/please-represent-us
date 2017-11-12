class Committee < ApplicationRecord
  has_many :subcommittees, class_name: 'Committee',
                           foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Committee'

  attr_accessor :chamber, :code, :name, :url
end
