require 'rails_helper'

describe 'parks#destroy', :type => :request do
  before do
    @park = FactoryGirl.create(:park)
  end

  it 'gives unauthorized if non user tries to delete the park' do
    delete "/parks/#{@park.id}"
    expect(response).to have_http_status(401)
  end

  it 'gives unauthorized if non user tries to update the park' do
    put "/parks/#{@park.id}", params: {
      name: "Orlando Wetlands Park"
    }
    expect(response).to have_http_status(401)
  end

  it 'gives unauthorized if non user tries to post a park' do
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
    }
    expect(response).to have_http_status(401)
  end
end
