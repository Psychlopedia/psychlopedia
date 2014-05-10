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
    self.publication_date = Date.today
  end
end
