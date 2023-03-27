require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create!(name: 'raymond', email: 'king@pride.com', password: '123456789', id: 1) }
  let(:icon_file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/png') }
  subject { Group.create(name: 'Trends', icon: icon_file, user_id: user.id) }

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  context 'when name is not present' do
    before { subject.name = nil }

    it 'is not valid' do
      expect(subject).to_not be_valid
    end
  end

  context 'when name is empty' do
    before { subject.name = ' ' }

    it 'is not valid' do
      expect(subject).to_not be_valid
    end
  end

  it 'name should have valid value' do
    expect(subject.name).to eql 'Trends'
  end

  context 'when user is not present' do
    before { subject.user = nil }

    it 'is not valid' do
      expect(subject).to_not be_valid
    end
  end

  context 'when user_id is not present' do
    before { subject.user_id = nil }

    it 'is not valid' do
      expect(subject).to_not be_valid
    end
  end

  context 'when user_id is empty' do
    before { subject.user_id = ' ' }

    it 'is not valid' do
      expect(subject).to_not be_valid
    end
  end
end
