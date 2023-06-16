require 'rails_helper'

RSpec.describe 'Articles API', type: :request do
  let!(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }
  let!(:token) { user.generate_jwt }
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }

  describe 'POST /api/articles' do
    let(:valid_attributes) { { article: { title: 'Learn Elm', body: 'Lorem ipsum' } } }

    context 'when the request is valid' do
      before { post '/api/articles', params: valid_attributes, headers: headers }

      it 'creates an article' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    # 異常系のテストなども書くことができます
  end

  # 他のエンドポイントに関するテストをここに追加
end
