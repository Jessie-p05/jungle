require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before :each do
      @user = User.new({:first_name => "amy", :last_name =>"potter", :password => "12345678",:password_confirmation => "12345678",:email => "amy@gmail.com"})
    end


    it "should present after save" do
      # @user = User.new({:first_name => "amy", :last_name =>"potter", :password => "12345678",:password_confirmation => "12345678",:email => "amy@gmail.com"})
      @user.save!
      expect(@user).to be_present
    end

    it "should not present if password is not the same as password confirmation" do
      # @user = User.new({:first_name => "bill", :last_name =>"potter", :password => "12345678",:password_confirmation => "123456786",:email => "bill@gmail.com"})
      @user.password_confirmation = "123456789"
      expect(@user.valid?).to be false
    end

    it "should require a unique email address to sigh up" do
      # @user = User.new({:first_name => "amy", :last_name =>"potter", :password => "12345678",:password_confirmation => "12345678",:email => "amy@gmail.com"})
      @user.save!
      @user2 = User.new({:first_name => "amy", :last_name =>"potter", :password => "12345678",:password_confirmation => "12345678",:email => "Amy@gmail.com"})
      expect(@user2.valid?).to be false
    end

    it "should fail if email is absent" do
      @user.email = nil
      expect(@user.valid?).to be false
    end

    it "should fail if first name is absent" do
      @user.first_name = nil
      expect(@user.valid?).to be false
    end

    it "should fail if last name is absent" do
      @user.last_name = nil
      expect(@user.valid?).to be false
    end

    it "should fail if length of password less than 6 " do
      @user.password = "12345"
      expect(@user.valid?).to be false
    end
  end

  describe '.authenticate_with_credentials' do
    before do 
      @user = User.new({:first_name => "amy", :last_name =>"potter", :password => "12345678",:password_confirmation => "12345678",:email => "amy@gmail.com"})
      @user.save!
    end
    
    it "should login when user enter correct email and password" do
      @user_login = User.authenticate_with_credentials("amy@gmail.com","12345678")
      expect(@user_login).to be_present
    end
    
    it "should not login when user enter incorrect password" do
      @user_login = User.authenticate_with_credentials("amy@gmail.com","1234567")
      expect(@user_login).to be_nil
    end
    
    it "should login when user enter space around correct email" do
      @user_login = User.authenticate_with_credentials("  amy@gmail.com","12345678")
      expect(@user_login).to be_present
    end

    it "should login when user enter correct email but in wrong case" do
      @user_login = User.authenticate_with_credentials("Amy@gmail.com","12345678")
      expect(@user_login).to be_present
    end

  end
end
