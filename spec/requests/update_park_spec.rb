require 'rails_helper'

describe "updates a park route", :type => :request do

  before do
    user = FactoryGirl.create(:user)
    post '/v1/auth_user', params: {
      email: user.email,
      password: user.password,
    }
    user_api_key = JSON.parse(response.body)["auth_token"]
    park = FactoryGirl.create(:park)
    put "/v1/parks/#{park.id}", params: {
      name: "Orlando Wetlands Park",
      api_key: user_api_key
    }
  end

  it 'returns the park name' do
    expect(JSON.parse(response.body)['message']).to eq("Your park has been successfully updated.")
  end

end
