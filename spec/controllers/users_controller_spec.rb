require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "redirects to the watchlists page if user is logged in" do
      user = create(:user)
      session[:user_id] = user.id
      get :new
      expect(response).to redirect_to user_watchlists_path(user)
    end
  end

  describe "POST #create" do
    it 'gives an error when email is empty' do
      post :create, params: {user: {email: '', password: '12345', password_confirmation: '12345' }}

      expect(response).to render_template(:new)
    end

    it 'gives an error when password is empty' do
      post :create, params: {user: {email: 'user@email.com', password: '', password_confirmation: '12345' }}

      expect(response).to render_template(:new)
    end

    it 'gives an error when passwords don\'t match' do
      post :create, params: {user: {email: 'user@email.com', password: '54321', password_confirmation: '12345' }}

      expect(response).to render_template(:new)
    end

    it 'gives an error when email is already taken' do
      user = create(:user)
      post :create, params: {user: {email: user.email, password: '12345', password_confirmation: '12345' }}

      expect(response).to render_template(:new)
    end

    it 'creates a new user when credentials are valid' do
      post :create, params: {user: {email: 'user@new.com', password: '12345', password_confirmation: '12345' }}

      expect(response).to have_http_status(:success)
    end
  end
end
