require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "redirects to the watchlists page if user is logged in" do
      user = create(:user)
      post :create, params: {session: {email: user.email, password: user.password }}
      get :new
      expect(response).to redirect_to user_watchlists_path(user)
    end
  end

  describe "POST #create" do
    it 'gives an error when email is empty' do
      user = create(:user)
      post :create, params: {session: {email: '', password: '12345' }}

      expect(response).to render_template(:new)
      expect(flash[:danger]).to match("Wrong email and/or password")
    end

    it 'gives an error when email is invalid' do
      user = create(:user)
      post :create, params: {session: {email: 'wrong@email.com', password: user.password }}

      expect(response).to render_template(:new)
      expect(flash[:danger]).to match("Wrong email and/or password")
    end

    it 'gives an error when password is invalid' do
      user = create(:user, email: 'user@email.com')
      post :create, params: {session: {email: user.email, password: 'invalid' }}

      expect(response).to render_template(:new)
      expect(flash[:danger]).to match("Wrong email and/or password")
    end

    it 'logs in a user when credentials are valid' do
      user = create(:user)
      post :create, params: {session: {email: user.email, password: user.password }}

      expect(response).to redirect_to user_watchlists_path(user)
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "GET #destroy" do
    it "returns http redirect" do
      get :destroy
      expect(response).to have_http_status(:redirect)
    end

    it "clears the session" do
      user = create(:user)
      post :create, params: {session: {email: user.email, password: user.password }}

      get :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end
