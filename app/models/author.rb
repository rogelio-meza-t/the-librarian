class Author < ActiveRecord::Base
  has_many :authorings
  has_many :books, :through => :authorings
  accepts_nested_attributes_for :authorings
end
