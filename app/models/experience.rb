class Experience < ActiveRecord::Base
  validates :body, uniqueness: true, presence: true
  
  default_scope {order('created_at DESC')}

  def self.random
    order('RANDOM()').first
  end
end
