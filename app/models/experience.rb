# encoding: utf-8

class Experience < ActiveRecord::Base
  extend FriendlyId

  N_STAR_RATING = 5

  has_many :cocktails, dependent: :destroy
  accepts_nested_attributes_for :cocktails, reject_if: lambda { |cocktail| cocktail[:substance].blank? && cocktail[:dosage].blank? }

  friendly_id :title, use: :slugged

  validates :pseudonym, presence: true, length: { maximum: 25 }
  validates :title, presence: true
  validates :body, presence: true

  before_save :defaults

  default_scope {order('created_at DESC')}

  scope :from_locale, -> { where('locale = ?', I18n.locale.to_s) }

  serialize :hearts, Hash

  # will_paginate per-page limit
  def self.per_page
    15
  end

  def self.random
    return Experience.none unless Experience.from_locale.exists?
    Experience.find Experience.from_locale.ids.sample
  end

  # XXX: a poor's man (and a poor's mind) search engine.
  def self.search(query)
    @results = []
    ["%#{query}", "%#{query}%", "#{query}%"].each do |query|
      ["title", "pseudonym"].each do |field|
        candidates = Experience.from_locale.where("LOWER(#{field}) LIKE ?", query)
        candidates.each { |candidate| @results << candidate } unless candidates.empty?
      end
    end
    @results.uniq
  end

  def defaults
    self.license = 'CC BY 4.0' if self.is_licensed
    self.publication_date = Date.today
  end

  def numeric_rating
    total_n_of_reviews = []

    weight_dot_n_reviews = self.hearts.inject([]) do |weights, (rating, amount)|
      total_n_of_reviews << amount
      weights << (rating * amount).to_f
      weights
    end

    if total_n_of_reviews.sum.zero?
      return 0.0
    else
      result = (weight_dot_n_reviews.sum / total_n_of_reviews.sum)
      result.round(2)
    end
  end

  def human_readable_rating
    if self.hearts.empty?
      ('&#9734;' * N_STAR_RATING).html_safe
    else
      (black_stars + white_stars).html_safe
    end
  end

  def calculate_black_stars
    numeric_rating.round
  end

  def black_stars
    ('&#9733;' * calculate_black_stars)
  end

  def calculate_white_stars
    (N_STAR_RATING - calculate_black_stars)
  end

  def white_stars
    ('&#9734;' * calculate_white_stars)
  end
end
