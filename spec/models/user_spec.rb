require 'rails_helper'

RSpec.describe User, :type => :model do
  
  
  let(:user) { FactoryGirl.create(:user) }

  it 'should exist' do
    user.should_not eq(nil)
  end
  
  it 'should be invalid without an email' do
    u = User.new(FactoryGirl.attributes_for(:no_email_user))
    u.should_not be_valid
  end

  it 'should be invalid if email exists in db' do
    user.save
    u2 = User.new(FactoryGirl.attributes_for(:user))
    u2.should_not be_valid
  end

  it 'should confirm password' do
    u = User.new(FactoryGirl.attributes_for(:wrong_confirm_password))
    u.should_not be_valid
  end

  it 'should validate acceptance of terms' do
    u = User.new(FactoryGirl.attributes_for(:user))
  end

end
