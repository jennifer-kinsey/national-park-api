require 'rails_helper'

RSpec.describe Park, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :state }
  it { should validate_presence_of :mailingaddress }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :description }
  it { should validate_presence_of :fee }
  it { should validate_presence_of :open_through }
  it { should validate_presence_of :closure }
  it { should validate_presence_of :amenities }
  it { should validate_presence_of :activities }
  it { should validate_presence_of :sq_mi }
  it { should validate_numericality_of :sq_mi }
  it { should validate_numericality_of :fee }

  describe "scopes", type: :request do
    before do
      @park = FactoryGirl.create(:park)
      @park2 = FactoryGirl.create(:park)
    end

    describe "name_scope" do
      it "returns all parks where search params equals the name" do
        get "/v1/parks?name_scope=#{@park.name}"
        expect(JSON.parse(response.body).first['name']).to eq(@park.name)
      end
    end

    describe "state_scope" do
      it "returns the all parks where search params equal the state" do
        get "/v1/parks?state_scope=#{@park.state}"
        expect(JSON.parse(response.body).first['state']).to eq(@park.state)
      end
    end

    describe "mailingaddress_scope" do
      it "returns all parks where search params equals the mailingaddress" do
        get "/v1/parks?mailingaddress_scope=#{@park.mailingaddress}"
        expect(JSON.parse(response.body).first['mailingaddress']).to eq(@park.mailingaddress)
      end
    end

    describe "phone_scope" do
      it "returns all parks where search params equals the phone" do
        get "/v1/parks?phone_scope=#{@park.phone}"
        expect(JSON.parse(response.body).first['phone']).to eq(@park.phone)
      end
    end

    describe "description_scope" do
      it "returns all parks where search params equals the description" do
        get "/v1/parks?description_scope=#{@park.description}"
        expect(JSON.parse(response.body).first['description']).to eq(@park.description)
      end
    end

    describe "fee_scope" do
      it "returns all parks where search params equals the fee" do
        get "/v1/parks?fee_scope=#{@park.fee}"
        expect(JSON.parse(response.body).first['fee']).to eq(@park.fee)
      end
    end

    describe "open_through_scope" do
      it "returns all parks where search params equals the open_through" do
        get "/v1/parks?open_through_scope=#{@park.open_through}"
        expect(JSON.parse(response.body).first['open_through']).to eq(@park.open_through)
      end
    end

    describe "closure_scope" do
      it "returns all parks where search params equals the closure" do
        get "/v1/parks?closure_scope=#{@park.closure}"
        expect(JSON.parse(response.body).first['closure']).to eq(@park.closure)
      end
    end

    describe "amenities_scope" do
      it "returns all parks where search params equals the amenities" do
        get "/v1/parks?amenities_scope=#{@park.amenities}"
        expect(JSON.parse(response.body).first['amenities']).to eq(@park.amenities)
      end
    end

    describe "activities_scope" do
      it "returns all parks where search params equals the activities" do
        get "/v1/parks?activities_scope=#{@park.activities}"
        expect(JSON.parse(response.body).first['activities']).to eq(@park.activities)
      end
    end

    describe "sq_mi_scope" do
      it "returns all parks where search params equals the sq_mi" do
        get "/v1/parks?sq_mi_scope=#{@park.sq_mi}"
        expect(JSON.parse(response.body).first['sq_mi']).to eq(@park.sq_mi)
      end
    end

    describe "random" do
      it "returns a random park" do
        get "/v1/parks?random=1"
        expect(JSON.parse(response.body).length).to eq(1)
      end
    end

  end
end
