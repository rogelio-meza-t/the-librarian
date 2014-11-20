class Authoring < ActiveRecord::Base
  belongs_to :book
  belongs_to :author
  accepts_nested_attributes_for :author
  accepts_nested_attributes_for :book
end
