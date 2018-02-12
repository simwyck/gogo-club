require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'first_name is not empty' do
      user = User.new(last_name: "Last", email: "me@domain.com").save
      expect(user).to eq(false)
    end

    it 'first_name is not spaces only' do
      user = User.new(first_name: "    ", last_name: "Last", email: "me@domain.com").save
      expect(user).to eq(false)
    end

    it 'last_name is not empty' do
      user = User.new(first_name: "First", email: "me@domain.com").save
      expect(user).to eq(false)
    end

    it 'last_name is not spaces only' do
      user = User.new(last_name: "    ", last_name: "Last", email: "me@domain.com").save
      expect(user).to eq(false)
    end

    it 'email is not empty' do
      user = User.new(first_name: "First", last_name: "Last").save
      expect(user).to eq(false)
    end

    it 'email is correctly formated' do
      user = User.new(first_name: "First", last_name: "Last", email: "me.domain.com").save
      user = User.new(first_name: "First", last_name: "Last", email: "me@domaincom").save
      expect(user).to eq(false)
    end

    it 'user is correctly saved' do
      user = User.new(first_name: "First", last_name: "Last", email: "me@domain.com").save
      expect(user).to eq(true)
    end

  end
end
