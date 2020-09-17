# Users
User.create!(
  email: "test@example.com",
  password: "Passw0rd",
  first_name: "ユーザー",
  last_name: "管理用",
  admin: 1,
  department_id: 4,
  confirmed_at: Time.zone.now
)

99.times do |n|
  email = "testuser-#{n + 1}@example.com"
  password = "Passw0rd"
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  admin = 0
  department_id = n.odd? ? 2 : 3

  User.create!(email: email,
               password: password,
               first_name: first_name,
               last_name: last_name,
               admin: admin,
               department_id: department_id,
               confirmed_at: Time.zone.now)
end
