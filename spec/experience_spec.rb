# encoding utf-8

require 'spec_helper'

describe Experience do
  describe "#create" do
    it 'create a valid new experience' do
      experience = Experience.create title: 'a test', pseudonym: '5vankmajer', body: 'this is a fine body'
    end

    it 'does not instantiate if the require fields are missing' do
      experience = Experience.create
      experience.errors.messages.keys.should include(:title, :pseudonym, :body)
    end

    it 'does not instantiate if one of the required fields are missing' do
      expect { Experience.create! title: 'a test', body: 'this is a fine body' }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
