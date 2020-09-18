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

# Users
User.create!(
  [
    {
      email: "test-1@example.com",
      password: "Passw0rd",
      first_name: "テスト",
      last_name: "管理用",
      admin: 1,
      department_id: 1,
      confirmed_at: Time.zone.now
    },
    {
      email: "test-2@example.com",
      password: "Passw0rd",
      first_name: "部長",
      last_name: "開発",
      admin: 0,
      department_id: 2,
      confirmed_at: Time.zone.now
    },
    {
      email: "test-3@example.com",
      password: "Passw0rd",
      first_name: "部長",
      last_name: "インフラ",
      admin: 0,
      department_id: 3,
      confirmed_at: Time.zone.now
    }
  ]
)

97.times do |n|
  email = "testuser-#{n + 4}@example.com"
  password = "Passw0rd"
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  admin = 0
  department_id = n.even? ? 2 : 3

  User.create!(
    email: email,
    password: password,
    first_name: first_name,
    last_name: last_name,
    admin: admin,
    department_id: department_id,
    confirmed_at: Time.zone.now
  )
end
