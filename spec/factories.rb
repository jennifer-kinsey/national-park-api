require 'faker'

FactoryGirl.define do
  factory :park do
    name Faker::StarTrek.location + " National Park"
    state Faker::Address.state
    mailingaddress "PO BOX " + Faker::Address.building_number + " " + Faker::Address.city + " " + Faker::Address.state
    phone "(" + Faker::Number.number(3) + ") " + Faker::Number.number(3) + "-" + Faker::Number.number(4)
    description Faker::Lorem.paragraph
    fee rand(5..25)
    open_through Faker::Date.forward(365)
    closure Faker::Address.street_name + " Trail"
    amenities Faker::Lorem.sentence(1)
    activities Faker::Lorem.sentence(1)
    sq_mi Faker::Number.decimal(3, 3)
  end
end
