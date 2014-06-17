require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let (:user) { FactoryGirl.create(:user) }

  describe "POST #create" do

    it "should create a new user" do
      expect{
        post :create, user: FactoryGirl.attributes_for(:user)
      }.to change(User, :count).by(1)
    end

    it "should redirect to login" do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to(login_path)
    end
  end

  describe "PUT #update" do
    it "should update existing user" do
      login(user)
      fname = user.first_name
      put :update, id: user, user: user.first_name = "John"
      expect(user.first_name).to eq("John")
    end

  end

end
