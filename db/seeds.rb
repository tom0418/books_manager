# departments
Department.create!(
  [
    {
      department_name: "バックオフィス",
      manager_name: "管理用 テスト",
      description: "バックオフィスです。事務処理、管理業務、人事・経理・法務・財務・総務といった部門・業務です。"
    },
    {
      department_name: "システムインテグレーション部",
      manager_name: "開発 部長",
      description: "クライアント先で開発支援を行う部署です。"
    },
    {
      department_name: "インフラ部",
      manager_name: "インフラ 部長",
      description: "クライアント先でインフラ整備を行う部署です。"
    }
  ]
)

# users
department1 = Department.find_by(id: 1)
department2 = Department.find_by(id: 2)
department3 = Department.find_by(id: 3)

department1.users.create!(
  email: "test-1@example.com",
  password: "Passw0rd",
  first_name: "テスト",
  last_name: "管理用",
  admin: true,
  confirmed_at: Time.zone.now
)

department2.users.create!(
  email: "test-2@example.com",
  password: "Passw0rd",
  first_name: "部長",
  last_name: "開発",
  admin: false,
  confirmed_at: Time.zone.now
)

department3.users.create!(
  email: "test-3@example.com",
  password: "Passw0rd",
  first_name: "部長",
  last_name: "インフラ",
  admin: false,
  confirmed_at: Time.zone.now
)

20.times do |n|
  email = "development-#{n + 1}@example.com"
  password = "Passw0rd"
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  admin = false

  department2.users.create!(
    email: email,
    password: password,
    first_name: first_name,
    last_name: last_name,
    admin: admin,
    confirmed_at: Time.zone.now
  )
end

20.times do |n|
  email = "infrastructure-#{n + 1}@example.com"
  password = "Passw0rd"
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  admin = false

  department3.users.create!(
    email: email,
    password: password,
    first_name: first_name,
    last_name: last_name,
    admin: admin,
    confirmed_at: Time.zone.now
  )
end

# books
50.times do |n|
  title = "#{Faker::Book.title} #{n + 1}"
  author = Faker::Book.author
  publisher = Faker::Book.publisher
  published_date = "2019-01-01"
  isbn10 = 4_000_000_000 + n + 1
  isbn13 = 9_000_000_000_000 + n + 1
  description = Faker::Books::Dune.quote

  Book.create!(
    title: title,
    author: author,
    publisher: publisher,
    published_date: published_date,
    isbn_10: isbn10,
    isbn_13: isbn13,
    description: description
  )
end
