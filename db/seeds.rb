require 'active_record/fixtures'
ActiveRecord::FixtureSet.create_fixtures("#{Rails.root}/db/fixtures", "experiences")
