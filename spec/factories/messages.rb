require 'faker'

FactoryGirl.define do
  factory :message do |m|
    m.content {Faker::Lorem.sentence(5)}
    m.user_id '1'
  end
end
