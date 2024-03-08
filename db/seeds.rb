AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? # rubocop:disable Layout/LineLength

10.times do
  User.create!(
    nickname: Faker::Name.initials(number: 5),
    email: Faker::Internet.email(domain: 'gmail.com'),
    password: 'password',
    password_confirmation: 'password',
    confirmed_at: Time.now
  )
end