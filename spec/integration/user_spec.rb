require 'swagger_helper'

describe 'Users API' do
  path '/api/v1/users' do
    post 'Creates an user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name: { type: :string },
          email: { type: :string },
          username: { type: :string },
          password: { type: :string }
        },
        required: [ 'username', 'password' ]
      }

      response '201', 'user created' do
        let(:user) { { user: { username: 'New User', password: 'strong_pass' } } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { user: { username: '', password: 'strong_pass' } } }
        run_test!
      end
    end
  end
end
