FactoryGirl.define do
  factory :response do
    full_name = Faker::Name.name
    last_name full_name.split(' ')[1]
    first_name full_name.split(' ')[0]
  end
end
