describe '#create' do
  context 'login' do
    let(:user) { User.create(username: 'maycon_rosa', password: 'new_pass') }

    it 'should return 200 when login is successful' do
      post '/authenticate', params: { username: user.username, password: 'new_pass' }

      expect(response.status).to eq(200)
      expect(session[:current_user_id]).to eq(user.id)
    end

    it 'should return 401 when login is not successful' do
      post '/authenticate', params: { username: user.username, password: 'wrong_pass' }

      expect(response.status).to eq(401)
    end
  end
end
