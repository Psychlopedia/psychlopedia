# encoding: utf-8

require 'yaml'

class Experience < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  validates :body, uniqueness: true, presence: true

  before_create :defaults

  default_scope {order('created_at DESC')}

  def self.random
    Experience.find Experience.ids.sample
  end

  def rating
    hearts = YAML.load(self.hearts)
    hearts.inject({}) do |hash, rating|
      hash[rating].nil? ? hash[rating] = 1 : hash[rating] += 1
      hash
    end
  end

  def cocktails
    YAML.load(self.substances)
  end

  private

  def defaults
    self.pseudonym ||= 'anónimo'
    self.title ||= 'sin título'
  end
end
