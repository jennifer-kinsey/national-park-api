require 'rails_helper'

describe "post a park route", :type => :request do

  before do
    user = FactoryGirl.create(:user)
    post '/auth_user', params: {
      email: user.email,
      password: user.password
    }

    @user_api_key = JSON.parse(response.body)["auth_token"]

    post '/parks', params: {
      name: "Spacelord National Park",
      state: "Florida",
      mailingaddress: "PO BOX Amazing, Kissimmee, FL",
      phone: "(407) 555-1234",
      description: "watch out for the sun and mosquitos",
      fee: 0,
      open_through: "August - then closed for no reason",
      amenities: "restrooms, handicap parking, and water fountains",
      activities: "take selfies, post on facebook",
      sq_mi: 444,
      closure: "Alligator Alley is off limits",
      api_key: @user_api_key
    }
  end


  it 'returns the park name' do
    expect(JSON.parse(response.body)['name']).to eq('Spacelord National Park')
  end

  it 'returns the park state' do
    expect(JSON.parse(response.body)['state']).to eq("Florida")
  end

  it 'returns the park mailingaddress' do
    expect(JSON.parse(response.body)['mailingaddress']).to eq("PO BOX Amazing, Kissimmee, FL")
  end

  it 'returns the park description' do
    expect(JSON.parse(response.body)['description']).to eq("watch out for the sun and mosquitos")
  end

  it 'returns the park fee' do
    expect(JSON.parse(response.body)['fee']).to eq(0)
  end

  it 'returns the park open_through' do
    expect(JSON.parse(response.body)['open_through']).to eq("August - then closed for no reason")
  end

  it 'returns the park closure' do
    expect(JSON.parse(response.body)['closure']).to eq("Alligator Alley is off limits")
  end

  it 'returns the park amenities' do
    expect(JSON.parse(response.body)['amenities']).to eq("restrooms, handicap parking, and water fountains")
  end

  it 'returns the park activities' do
    expect(JSON.parse(response.body)['activities']).to eq("take selfies, post on facebook")
  end

  it 'returns the park sq_mi' do
    expect(JSON.parse(response.body)['sq_mi']).to eq(444)
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end

  it 'returns error for missing param in park post' do
    post '/parks', params: {
      name: '',
      state: "Florida",
      mailingaddress: "PO BOX Amazing, Kissimmee, FL",
      phone: "(407) 555-1234",
      description: "watch out for the sun and mosquitos",
      fee: "none",
      open_through: "August - then closed for no reason",
      closure: "Alligator Alley is off limits",
      amenities: "restrooms, handicap parking, and water fountains",
      activities: "take selfies, post on facebook",
      sq_mi: 444,
      api_key: @user_api_key
    }
    expect(response).to have_http_status(422)
  end
end
