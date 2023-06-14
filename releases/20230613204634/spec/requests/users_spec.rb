require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /api/users" do
    let(:valid_attributes) do
      {
        user: {
          username: Faker::Internet.username,
          email: Faker::Internet.email,
          password: Faker::Internet.password(min_length: 8)
        }
      }
    end

    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post '/api/users', params: valid_attributes
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post '/api/users', params: valid_attributes
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post '/api/users', params: { user: { username: '', email: '', password: '' } }
        }.to change(User, :count).by(0)
      end

      it "renders a JSON response with errors for the new user" do
        post '/api/users', params: { user: { username: '', email: '', password: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
