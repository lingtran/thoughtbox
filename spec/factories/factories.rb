FactoryGirl.define do
  factory :user do
    email "email@fake.com"
    password "password"
    password_confirmation "password"
  end
end
