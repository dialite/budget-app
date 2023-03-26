require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  subject do
    @user = User.create!(name: 'someone', email: 'user@user.com', password: 'password', id: 1)
    @group = Group.create!(name: 'stationary', icon: @icon_file, user: @user)
    @expense = Expense.create(name: 'pen', amount: 10.2)
  end

  before do
    @icon_file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/png')
    subject
  end

  describe 'GET /index' do
    before(:each) { get group_expenses_path(group_id: @group.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    before(:each) { get '/groups/:1/expenses/:2' }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /new' do
    before(:each) { get new_group_expense_path(group_id: @group.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    before(:each) { post group_expenses_path(group_id: @group.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /edit' do
    before(:each) { get '/groups/:1/expenses/:2/edit' }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /update' do
    before(:each) { put '/groups/:1/expenses/:2' }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /update' do
    before(:each) { delete '/groups/:1/expenses/:2' }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end
end