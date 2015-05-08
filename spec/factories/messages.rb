require 'faker'

FactoryGirl.define do
  factory :message do |m|
    m.content {Faker::Lorem.sentence(5)}
    m.user_id '1'
  end

  factory :invalid_message, parent: :message do |m|
    m.content nil
  end
end
