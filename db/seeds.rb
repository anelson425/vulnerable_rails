require 'faker'

Faker::Config.locale = 'en-US'

100.times do
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  user_name = "#{first_name}.#{last_name}"
  user = {
    first_name: first_name,
    last_name: last_name,
    user_name: user_name,
    email: Faker::Internet.safe_email(user_name),
    password: Faker::Internet.unique.password(10, 20),
    phone_number: Faker::PhoneNumber.unique.phone_number
  }

  User.create(user)
end
