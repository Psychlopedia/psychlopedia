# encoding: utf-8

class Experience < ActiveRecord::Base
  extend FriendlyId

  has_many :cocktails, dependent: :destroy
  accepts_nested_attributes_for :cocktails, reject_if: lambda { |cocktail| cocktail[:substance].blank? && cocktail[:dosage].blank? }

  friendly_id :title, use: :slugged

  validates :pseudonym, presence: true, length: { maximum: 25 }
  validates :title, presence: true
  validates :body, presence: true

  before_save :defaults

  default_scope {order('created_at DESC')}

  serialize :hearts, Hash

  # will_paginate per-page limit
  def self.per_page
    15
  end

  def self.random
    return Experience.none unless Experience.exists?
    Experience.find Experience.ids.sample
  end

  # XXX: a poor's man (and a poor's mind) search engine.
  def self.search(query)
    @results = []
    ["%#{query}", "%#{query}%", "#{query}%"].each do |query|
      ["title", "pseudonym"].each do |field|
        candidates = Experience.where("LOWER(#{field}) LIKE ?", query)
        @results << candidates unless candidates.empty?
      end
    end
    @results.flatten.uniq
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
      five_white_stars = ('&#9734;' * 5)
      five_white_stars.html_safe
    else
      black_stars = self.hearts.max_by { |stars, quantity| quantity }.first.to_i

      n_of_black_stars = ('&#9733;' * black_stars)
      n_of_white_stars = ('&#9734;' * (5 - black_stars))

      star_rating = n_of_black_stars + n_of_white_stars
      star_rating.html_safe
    end
  end
end
