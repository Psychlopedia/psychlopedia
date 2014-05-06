class ExperienceCategory < ActiveRecord::Base
  belongs_to :experience
  belongs_to :category
end
