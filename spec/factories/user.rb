require 'faker'

FactoryGirl.define do 
  factory :user do |f|
    f.name { Faker::Name.name }
    f.email "bla@bla101.com"
    f.password              "password"
    f.password_confirmation "password"
  end
end
