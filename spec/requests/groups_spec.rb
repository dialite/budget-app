require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  subject do
    @user = User.create!(name: 'leader', email: 'leader.group@team.com', password: '123456789', id: 2)
    @group = Group.create!(name: 'The players', icon: @icon_file, user: @user)
  end

  before do
    @icon_file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'photo.png')
    subject
  end

  describe 'GET /index' do
    before(:each) { get groups_path }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    before(:each) { get group_path(id: @group.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /new' do
    before(:each) { get new_group_path }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    before(:each) { post groups_path }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /edit' do
    before(:each) { get edit_group_path(id: @group.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /update' do
    before(:each) { put group_path(id: @group.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /update' do
    before(:each) { delete group_path(id: @group.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end
end
