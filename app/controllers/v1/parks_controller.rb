class V1::ParksController < ApplicationController
  before_action :authenticate_request!, :except => [:show, :index]


  def index
    @parks = Park.filter(params.slice(:name_scope, :state_scope, :mailingaddress_scope, :phone_scope, :description_scope, :max_fee_scope, :open_through_scope, :closure_scope, :amenities_scope, :min_sq_mi_scope, :random))
    json_response(@parks)
  end

  def show
    @park = Park.find(params[:id])
    json_response(@park)
  end

  def create
    @park = Park.create!(park_params)
    json_response(@park, :created)
  end

  def update
    @park = Park.find(params[:id])
    if @park.update!(park_params)
      render status: 200, json: {
        message: "Your park has been successfully updated."
      }
    end
  end

  def destroy
    @park = Park.find(params[:id])
    if @park.destroy
      render status: 200, json: {
        message: "Your park has been deleted."
      }
    end
  end

  private

  def park_params
    params.permit(:name, :state, :mailingaddress, :phone, :description, :fee, :open_through, :closure, :amenities, :activities, :sq_mi)
  end
end
