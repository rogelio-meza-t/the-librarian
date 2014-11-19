# == Schema Information
#
# Table name: books
#
#  id               :integer          not null, primary key
#  title            :string(255)      not null
#  author           :string(255)      not null
#  editorial        :string(255)      not null
#  original_title   :string(255)
#  translation      :string(255)
#  edition          :integer
#  edition_date     :date
#  edition_place    :string(255)
#  publication_year :integer
#  isbn             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Book < ActiveRecord::Base

  validates :title, :author, :editorial, :presence => true
  validates :edition, :publication_year, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  #paperclip
  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100#", :mini => "30x30#" }, :default_url => "missing_:style.jpeg"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/


end
