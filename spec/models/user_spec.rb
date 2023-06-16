require 'rails_helper'

RSpec.describe User, type: :model do
  # ここではpassword_digestに関するテストを書きます
  it 'should have a valid password_digest' do
    user = User.new(password: nil)
    expect(user).not_to be_valid
  end

  # generate_jwtメソッドのテスト
  it 'should generate a valid JWT token' do
    user = User.create(username: 'testuser', email: 'test@example.com', password: 'password')
    token = user.generate_jwt
    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
    expect(decoded_token.first['id']).to eq(user.id)
  end
end
