# FIX: serialization of self.hearts

class Experience < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  validates :body, uniqueness: true, presence: true

  before_save :defaults

  default_scope {order('created_at DESC')}

  def self.random
    order('RANDOM()').first
  end

  def defaults
    self.pseudonym ||= 'anonymous'
    self.title ||= 'untitled experience'
    self.hearts = []
  end

  def grouped_rating
    hearts.inject({}) do |hash, rating|
      hash[rating].nil? ? hash[rating] = 1 : hash[rating] += 1
      hash
    end
  end
end
