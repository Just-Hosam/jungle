require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    it 'validates user will successfully save' do
      user = User.create(
        name: 'Hosam',
        email: 'hosam@test.com',
        password: 'testing123',
        password_confirmation: 'testing123'
      )

      expect(user).to be_valid
      expect(user.name).to eq('Hosam')
      expect(user.email).to eq('hosam@test.com')
      expect(user.password).to eq('testing123')
      expect(user.password_confirmation).to eq('testing123')
    end

    it 'validates presence of user Email' do
      user = User.create(
        name: 'Hosam',
        email: nil,
        password: 'testing123',
        password_confirmation: 'testing123'
      )

      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'validates presence of user Name' do
      user = User.create(
        name: nil,
        email: 'hosam@test.com',
        password: 'testing123',
        password_confirmation: 'testing123'
      )

      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Name can't be blank"
    end

    it 'validates presence of user Password' do
      user = User.create(
        name: 'hosam',
        email: 'hosam@test.com',
        password: nil,
        password_confirmation: 'testing123'
      )

      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Password can't be blank"
    end

    it 'validates presence of user Confirmation Password' do
      user = User.create(
        name: 'hosam',
        email: 'hosam@test.com',
        password: 'testing123',
        password_confirmation: nil
      )

      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it 'validates user Password and Confirmation Password are the same' do
      user = User.create(
        name: 'hosam',
        email: 'hosam@test.com',
        password: 'testing321',
        password_confirmation: 'testing123'
      )

      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'validates user is not in the database' do
      user1 = User.create(
        name: 'hosam',
        email: 'hosam@test.com',
        password: 'testing123',
        password_confirmation: 'testing123'
      )

      user2 = User.create(
        name: 'lol',
        email: 'HOSAM@test.com',
        password: 'newpass123',
        password_confirmation: 'newpass123'
      )

      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include "Email has already been taken"
    end

    it 'validates user Password has at least 8 characters' do
      user = User.create(
        name: 'hosam',
        email: 'hosam@test.com',
        password: 'test',
        password_confirmation: 'test'
      )

      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include "Password is too short (minimum is 8 characters)"
    end



  end

  describe '.authenticate_with_credentials' do
    it 'should find and authinticate user, then give access' do
      createdUser = User.create(
        name: 'Hosam',
        email: 'hosam@test.com',
        password: 'testing123',
        password_confirmation: 'testing123'
      )
      checkedUser = User.authenticate_with_credentials('hosam@test.com', 'testing123')

      expect(checkedUser).to eq(createdUser)
    end

    it 'should find and authinticate user, then deny access' do
      createdUser = User.create(
        name: 'Hosam',
        email: 'hosam@test.com',
        password: 'testing123',
        password_confirmation: 'testing123'
      )
      checkedUser = User.authenticate_with_credentials('hosam@test.com', 'testing321')

      expect(checkedUser).to eq(nil)
    end

    it 'should find and authinticate user after trimming whitespace, then give access' do
      createdUser = User.create(
        name: 'Hosam',
        email: 'hosam@test.com',
        password: 'testing123',
        password_confirmation: 'testing123'
      )
      checkedUser = User.authenticate_with_credentials('  hosam@test.com     ', 'testing123')

      expect(checkedUser).to eq(createdUser)
    end

    it 'should find and authinticate user after trimming whitespace, then deny access' do
      createdUser = User.create(
        name: 'Hosam',
        email: 'hosam@test.com',
        password: 'testing123',
        password_confirmation: 'testing123'
      )
      checkedUser = User.authenticate_with_credentials('  hosam@test.com     ', 'testing321')

      expect(checkedUser).to eq(nil)
    end

    it 'should find and authinticate user regardless of letter case, then give access' do
      createdUser = User.create(
        name: 'Hosam',
        email: 'hosam@test.com',
        password: 'testing123',
        password_confirmation: 'testing123'
      )
      checkedUser = User.authenticate_with_credentials('HOSAM@test.com', 'testing123')

      expect(checkedUser).to eq(createdUser)
    end

    it 'should find and authinticate user regardless of letter case, then deny access' do
      createdUser = User.create(
        name: 'Hosam',
        email: 'hosam@test.com',
        password: 'testing123',
        password_confirmation: 'testing123'
      )
      checkedUser = User.authenticate_with_credentials('HOSAM@test.com', 'testing321')

      expect(checkedUser).to eq(nil)
    end

  end
end
