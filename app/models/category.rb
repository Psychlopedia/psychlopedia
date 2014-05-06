class Category < ActiveRecord::Base
  include FriendlyId

  has_many :experience_categories
  has_many :experiences, through: :experience_categories

  friendly_id :name, use: :slugged
end
