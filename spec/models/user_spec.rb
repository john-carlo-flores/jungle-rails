require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new(
        first_name: 'Mowgli',
        last_name: 'Man-cub',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end

    context 'User' do
      it 'must be valid when first_name, last_name, email and passwords are populated' do
        @user.save

        expect(@user.errors.full_messages).to be_empty
      end
    end

    context 'Password' do
      it 'must not be valid when password field is blank' do
        @user.password = nil
        @user.save

        expect(@user.errors.full_messages).not_to be_empty
      end

      it 'must not be valid when password confirmation field is blank' do
        @user.password_confirmation = nil
        @user.save

        expect(@user.errors.full_messages).not_to be_empty
      end

      it 'must not be valid when password fields do not match' do
        @user.password_confirmation = 'password-mismatch'
        @user.save
        
        expect(@user.errors.full_messages).not_to be_empty
      end

      it 'must not be valid when password length is less than 6' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.save

        expect(@user.errors.full_messages).not_to be_empty
      end
    end

    context 'Email' do
      it 'must be unique and case insensitive' do
        @user.save
        
        @same_email_user = User.create(
        first_name: 'Baloo',
        last_name: 'Sloth-bear',
        email: 'TEST@TEST.com',
        password: 'password',
        password_confirmation: 'password'
        )
        
        expect(@same_email_user.errors.full_messages).not_to be_empty
      end
      
      it 'must not be valid when email is blank' do
        @user.email = nil
        @user.save
        
        expect(@user.errors.full_messages).not_to be_empty
      end
    end

    context 'Name' do
      it 'must not be valid when first name field is blank' do
        @user.first_name = nil
        @user.save
        
        expect(@user.errors.full_messages).not_to be_empty
      end

      it 'must not be valid when last name field is blank' do
        @user.last_name = nil
        @user.save
        
        expect(@user.errors.full_messages).not_to be_empty
      end
    end
    
    after(:each) do
      @user.destroy unless @user.nil?
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(
        first_name: 'Mowgli',
        last_name: 'Man-cub',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end

    it 'should fail if stored password does not equal password provided at login' do
      @user = User.authenticate_with_credentials('test@test.com', 'passwor')

      expect(@user).to be_falsey
    end

    it 'should be valid if stored password matches password provided at login' do
      @user = User.authenticate_with_credentials('test@test.com', 'password')

      expect(@user).to be_truthy
    end

    it 'should be valid if email has extra spaces and password is correct' do
      @user = User.authenticate_with_credentials(' test@test.com ', 'password')
      
      expect(@user).to be_truthy
    end
      
    it 'should be valid if email has mismatch case and password is correct' do
      @user = User.authenticate_with_credentials('TesT@tEst.com', 'password')
      
      expect(@user).to be_truthy
    end

    it 'should fail if email is invalid and password is correct' do
      @user = User.authenticate_with_credentials('test123@test.com', 'password')
      
      expect(@user).to be_nil
    end
  end
end
