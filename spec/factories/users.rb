FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "Passw0rd" }
    first_name { "ユーザー" }
    last_name { "テスト" }
    admin { 1 }
    department_id { 1 }
  end
end
