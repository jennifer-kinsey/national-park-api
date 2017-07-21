class Seed

  def self.begin
    seed = Seed.new
    seed.generate_parks
  end

  def generate_parks
    250.times do |i|
      park = Park.create!(
        name: Faker::StarTrek.location + " National Park",
        state: Faker::Address.state,
        mailingaddress: "PO BOX " + Faker::Address.building_number + " " + Faker::Address.city + " " + Faker::Address.state,
        phone: "(" + Faker::Number.number(3) + ") " + Faker::Number.number(3) + "-" + Faker::Number.number(4),
        description: Faker::Lorem.paragraph,
        fee: Faker::Number.number(1),
        open_through: Faker::Date.forward(365),
        closure: Faker::Address.street_name + " Trail",
        amenities: Faker::Lorem.sentence(1),
        activities: Faker::Lorem.sentence(1),
        sq_mi: Faker::Number.decimal(3, 3)
      )
    end
  end
end

Seed.begin
