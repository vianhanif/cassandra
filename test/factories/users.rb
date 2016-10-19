FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "password10"
    password_confirmation "password10"
  end
end
