FactoryBot.define do
  factory :book do
    title { "テスト書籍" }
    author { "テスト著者名" }
    published_date { "2019-01-01" }
    isbn_10 { 4_000_000_001 }
    isbn_13 { 9_000_000_000_001 }
    quantity { 1 }
  end
end
