require 'rails_helper'

describe User do
  context 'validations' do
    describe '#username' do
      describe 'when username already exists' do
        it 'should not be valid' do
          new_user = User.new(username: 'maycon_rosa', password: 'strong_pass')
          User.create(username: 'maycon_rosa', password: 'new_pass')

          expect(new_user).to_not be_valid
        end
      end

      describe 'when username does not exist' do
        it 'should be valid' do
          user = User.new(username: 'new_username', password: 'new_pass')

          expect(user).to be_valid
        end
      end
    end
  end
end
