FactoryGirl.define do
  factory :user do
    email "email@fake.com"
    password_digest "password"
    password_confirmation "password"
  end
end
