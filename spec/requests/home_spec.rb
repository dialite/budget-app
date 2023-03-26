require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /index' do
    before(:each) { get root_path }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end
  end
end
