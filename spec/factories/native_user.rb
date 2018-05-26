FactoryBot.define do
  factory :native_user do
    name 'Bob'
    sequence(:username) { |n| "user-#{n}"}
    sequence(:email) { |n| "user-#{n}@test.com"}
    password 'test'
  end
end
