require 'faker'
Park.destroy_all

250.times do |i|
  park = FactoryGirl.create!(
    name: Faker::StarTrek.location + "National Park"
    state: Faker::Address.state
    mailingaddress: "PO BOX " + Faker::Address.building_number + " Faker::Address.city " + state
    phone: "(" + Faker::Number.number(3) + ") " + Faker::Number.number(3) + "-" + Faker::Number.number(4)
    description: Faker::Lorem.paragraph
    fee: Faker::Number.number(1)
    open_through: Faker::Date.forward(365)
    closure: Faker::Address.street_name + " Trail"
    amenities: Faker::Lorem.sentences(1)
    activities: Faker::Lorem.sentences(1)
    sq_mi: Faker::Number.decimal(3, 3)
  )
end
