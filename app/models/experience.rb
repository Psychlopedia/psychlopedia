# encoding: utf-8

class Experience < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  validates :body, uniqueness: true, presence: true

  before_save :defaults

  default_scope {order('created_at DESC')}

  serialize :hearts, Hash

  def self.random
    return Experience.none unless Experience.exists?
    Experience.find Experience.ids.sample
  end

  def defaults
    self.pseudonym ||= 'anónimo'
    self.title ||= 'sin título'
  end

  def human_readable_rating
    return if self.hearts.empty?

    black_stars = self.hearts.max_by { |stars, quantity| quantity }.first.to_i
    complete_rating = (('&#9733;' * black_stars) + ('&#9734;' * (5 - black_stars))).html_safe

    complete_rating
  end
end
