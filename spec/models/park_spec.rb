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
 end
