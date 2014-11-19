class Author < ActiveRecord::Base
  has_many :authorings
  has_many :books, :through => :authorings
end
