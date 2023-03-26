require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'Raymond', password: 'newlight', email: 'contentcreator@fun.com', id: 1)
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should have a correct value' do
      expect(subject.name).to eql 'Raymond'
    end
  end
end
