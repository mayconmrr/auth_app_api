RSpec.describe 'Session', type: :request do
  context 'login' do
    let(:user) { User.create(username: 'maycon_rosa', password: 'new_pass') }

    it 'should return 200 when login is successful' do
      post '/api/v1/authenticate', params: { username: user.username, password: 'new_pass' }

      expect(response.status).to eq(200)
    end

    it 'should return 401 when login is not successful' do
      post '/api/v1/authenticate', params: { username: user.username, password: 'wrong_pass' }

      expect(response.status).to eq(401)
    end
  end
end
