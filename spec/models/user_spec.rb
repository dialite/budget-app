require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Raymond', password: 'newlight', email: 'contentcreator@fun.com', id: 1) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'has the correct name value' do
      expect(user.name).to eq 'Raymond'
    end
  end
end

