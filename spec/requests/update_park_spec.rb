require 'rails_helper'

describe "updates a park route", :type => :request do

  before do
    @park = FactoryGirl.create(:park)
    put "/parks/#{@park.id}", params: {
      name: "Orlando Wetlands Park"
    }
  end

  it 'returns the park name' do
    expect(JSON.parse(response.body)['message']).to eq("Your park has been successfully updated.")
  end

end
