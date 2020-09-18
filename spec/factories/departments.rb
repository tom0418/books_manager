FactoryBot.define do
  factory :department do
    department_name { "テスト部署" }
    manager_name    { "テスト ユーザー" }
    description     { "テストテストテスト" }
  end
end
