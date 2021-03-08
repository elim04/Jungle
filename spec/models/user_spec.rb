require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    
    it 'should save a new user successfully' do

      @user = User.new(first_name: 'Spiderman', last_name:'Webs', email: 'ondaweb@gmail.com', password: 'webs123', password_confirmation: 'webs123')

      @user.save!
      
      expect(@user).to be_valid

    end

    it 'should confirm password and password confirmation are the same' do

      @user = User.new(first_name: 'Spiderman', last_name:'Webs', email: 'ondaweb@gmail.com', password: 'webs123', password_confirmation: 'webs')

      @user.save
      
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end

    it 'should only save emails that are unique' do

      @user1 = User.new(first_name: 'Spiderman', last_name:'Webs', email: 'ondaweb@gmail.com', password: 'webs123', password_confirmation: 'webs123')
      @user1.save!

      @user2 = User.new(first_name: 'Spiderman', last_name:'Webs', email: 'ondaweb@gmail.com', password: 'webs123', password_confirmation: 'webs123')

      @user2.save
      
      expect(@user2).not_to be_valid 

    end

    it 'should only save users with password mini mum length of 5 characters' do

      @user1 = User.new(first_name: 'Spiderman', last_name:'Webs', email: 'ondaweb@gmail.com', password: 'webs', password_confirmation: 'webs')

      @user1.save
      
      expect(@user1).not_to be_valid 

    end
 end

describe '.authenticate_with_credentials' do

  it 'should log in user if correct credentials' do
    @user = User.new(first_name: 'Spiderman', last_name:'Webs', email: 'ondaweb@gmail.com', password: 'webs123', password_confirmation: 'webs123')

    @user.save

    user = User.authenticate_with_credentials("ondaweb@gmail.com", "webs123")
    expect(user).to be == @user 

  end

  it 'shold not log in user if incorrect credientials' do

    @user = User.new(first_name: 'Spiderman', last_name:'Webs', email: 'ondaweb@gmail.com', password: 'webs123', password_confirmation: 'webs123')
    
    @user.save

    user = User.authenticate_with_credentials("ondaweb@gmail.com", "webs")
    expect(user).not_to be == @user 

  end

  it 'should still allow authentication if spaces before or after email' do
    @user = User.new(first_name: 'Spiderman', last_name:'Webs', email: 'ondaweb@gmail.com', password: 'webs123', password_confirmation: 'webs123')

    @user.save

    user = User.authenticate_with_credentials(" ondaweb@gmail.com ", "webs123")
    expect(user).to be == @user 


  end

  it 'should still allow authentication if wrong case is used for correct email' do
    @user = User.new(first_name: 'Spiderman', last_name:'Webs', email: 'ondaweb@gmail.com', password: 'webs123', password_confirmation: 'webs123')

    @user.save

    user = User.authenticate_with_credentials(" ondaweb@GMAIL.com ", "webs123")
    expect(user).to be == @user 


  end


end


end
