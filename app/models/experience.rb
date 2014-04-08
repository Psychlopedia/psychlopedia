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

  # XXX: fucking LOL. improve this, for fuck's sake.
  def human_readable_rating
    return if self.hearts.empty?
    stars = self.hearts.max_by { |stars, quantity| quantity }.first.to_i
    stars_rating = ('&#9733;' * stars).html_safe
    stars_rating
  end
end
