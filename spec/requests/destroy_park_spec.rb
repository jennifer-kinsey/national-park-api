require 'rails_helper'

describe 'parks#destroy', :type => :request do

  it 'deletes the park' do
    park = FactoryGirl.create(:park)
    delete "/parks/#{park.id}"
    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)['message']).to eq("Your park has been deleted.")
  end

  it 'responds with 404' do
    park = FactoryGirl.create(:park)
    park.destroy
    get "/parks/#{park.id}"
    expect(response).to have_http_status(404)
  end
end
