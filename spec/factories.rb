FactoryGirl.define do
  factory :user do |f|
    f.sequence(:email) { |n| "foo#{n}@example.com" }
    f.password "secret"
  end
  
  factory :stock do |f|
    f.ticker "GOOG"
  end
end