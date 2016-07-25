FactoryGirl.define do
  factory :user do
    email "email@fake.com"
    password "password"
    password_confirmation "password"
  end

  factory :link do
    sequence(:title) { |n| "Link Title #{n}" }
    url "https://www.youtube.com/watch?v=UXW5_Dgj_5o"
    read 0

    trait :read do
      read 1
    end
  end
end
