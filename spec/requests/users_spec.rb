require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { create(:user, password: 'password') }
  let(:valid_credentials) { { user: { email: user.email, password: 'password' } } }

  # ユーザー作成のテスト
  describe 'POST /api/users' do
    let(:valid_attributes) { { user: { username: 'testuser', email: 'test@example.com', password: 'password' } } }


    context 'when the request is valid' do
      before { post '/api/users', params: valid_attributes }

      it 'creates a user' do
        expect(json['username']).to eq('testuser')
        expect(json['email']).to eq('test@example.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/users', params: { user: { username: 'foo' } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/can't be blank/)
      end
    end
  end

  # ユーザーログインのテスト
  describe 'POST /api/users/login' do
    let(:valid_credentials) { { user: { email: user.email, password: 'password' } } }
    let(:invalid_credentials) { { user: { email: user.email, password: 'wrong_password' } } }

    context 'when the request is valid' do
      before { post '/api/users/login', params: valid_credentials }

      it 'returns a JWT token' do
        expect(json['token']).not_to be_nil
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/users/login', params: invalid_credentials }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end

      it 'returns an authentication failure message' do
        expect(response.body).to match(/Invalid email or password/)
      end
    end
  end
end
