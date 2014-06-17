require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  it "should assign current user.id to session[:user_id]" do
    get :new
    user = FactoryGirl.create(:user)
    login(user)
    expect(session[:user_id]).to eq(user.id)
  end

  it "should remove current user.id from session[:user_id]" do
    get :new
    user = FactoryGirl.create(:user)
    login(user)
    expect(session[:user_id]).to eq(user.id)
    get :destroy
    expect(session[:user_id]).to eq(nil)
  end

end
