describe '#create' do
  context 'User' do
    it 'should return 201 when a new user is created' do
      post '/users', params: { user: { username: 'new_username', password: 'new_pass' } }

      expect(response.status).to eq(201)
    end

    it 'should return 422 when an username is not informed' do
      post '/users', params: { user: { password: 'strong_password' } }
      response_body = response.parsed_body['username'].first

      expect(response_body).to eq("can't be blank")
      expect(response.status).to eq(422)
    end

    it 'should return 422 when username informed has already been taken' do
      User.create(username: 'new_user', password: 'new_pass')
      post '/users', params: { user: { username: 'new_user', password: 'strong_password' } }
      response_body = response.parsed_body['username'].first

      expect(response_body).to eq('has already been taken')
      expect(response.status).to eq(422)
    end
  end
end
