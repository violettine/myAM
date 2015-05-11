require 'faker'

FactoryGirl.define do 
  factory :user do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Name.email }
    f.password              "password"
    f.password_confirmation "password"
  end
end
