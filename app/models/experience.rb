# encoding: utf-8

class Experience < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  validates :body, uniqueness: true, presence: true

  before_save :defaults

  default_scope {order('created_at DESC')}

  def self.random
    return Experience.none unless Experience.exists?
    Experience.find Experience.ids.sample
  end

  def defaults
    self.pseudonym ||= 'anónimo'
    self.title ||= 'sin título'
  end
end
