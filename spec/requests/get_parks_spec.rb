require 'rails_helper'

describe "get all parks route", :type => :request do
  let!(:parks) { FactoryGirl.create_list(:park, 20)}
  before { get '/parks'}

  it 'returns all parks' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns status code of 404 when not found' do
    get '/parks/00'
    expect(response).to have_http_status(404)
  end

  it 'should return 200 for specific park' do
    park1 = parks.first
    get "/parks/#{park1.id}"
    expect(response).to have_http_status(200)
  end
end
