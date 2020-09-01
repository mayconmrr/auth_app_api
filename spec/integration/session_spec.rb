require 'swagger_helper'

describe 'Session API' do
  path '/api/v1/authenticate' do
    post 'Login' do
      tags 'Sessions'
      consumes 'application/json'
      parameter name: :login, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string }
        },
        required: [ 'username', 'password' ]
      }

      response '200', 'logged' do
        User.create(username: 'Dodo', password: 'available')
        let(:login) { { username: 'Dodo', password: 'available' } }
        run_test!
      end

      response '401', 'invalid request' do
        let(:login) { { username: 'New User', password: '' } }
        run_test!
      end
    end
  end
end
