require 'rails_helper'

describe 'parks#destroy', :type => :request do
  before do
    @park = FactoryGirl.create(:park)
    @user = User.create(
      email: 'randy3@email.com',
      password: 'password',
      password_confirmation: 'password'
    )
    delete "/parks/#{@park.id}"
  end

  it 'deletes the park' do
    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)['message']).to eq("Your park has been deleted.")
  end

  it 'responds with 404' do
    get "/parks/#{@park.id}"
    expect(response).to have_http_status(404)
  end
end
