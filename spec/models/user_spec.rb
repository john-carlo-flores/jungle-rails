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
    end
    
    after(:each) do
      @user.destroy unless @user.nil?
    end
  end
end
