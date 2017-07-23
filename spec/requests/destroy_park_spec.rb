require 'rails_helper'

describe 'parks#destroy', :type => :request do
  before do
    @park = FactoryGirl.create(:park)
    user = FactoryGirl.create(:user)
    post '/auth_user', params: {
      email: user.email,
      password: user.password
    }
    @user_api_key = JSON.parse(response.body)["auth_token"]
  end

  it 'deletes the park' do
    delete "/parks/#{@park.id}?api_key=#{@user_api_key}"
    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)['message']).to eq("Your park has been deleted.")
  end

  it 'responds with 404' do
    @park.destroy
    get "/parks/#{@park.id}"
    expect(response).to have_http_status(404)
  end
end
