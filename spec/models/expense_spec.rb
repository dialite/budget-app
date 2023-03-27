require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: 'raymond', email: 'king@pride.com', password: '123456789') }

  subject { described_class.create(name: 'Trends', amount: 10.1, user: user) }

  it { is_expected.to be_valid }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be empty' do
    subject.name = ' '
    expect(subject).to_not be_valid
  end

  it 'amount should not be less than 0' do
    subject.amount = -1.1
    expect(subject).to_not be_valid
  end

  it 'amount should be a decimal' do
    expect(subject.amount).to be_within(0.0001).of(10.1)
  end

  it 'amount should have a decimal point' do
    expect(subject.amount.to_s).to include('.')
  end

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'user_id should be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
