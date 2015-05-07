#User
User.create!(name:  "Nina Nickel",
             email: "bla@bla.com",
             password:              "password",
             password_confirmation: "password")

#More user
num = 0
10.times do
  User.create!(name: 'Person'+num.to_s,
               email: 'bla@bla'+num.to_s+'.com',
               password:              'password',
               password_confirmation: 'password')
  num += 1
end

# Message
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.messages.create!(content: content) }
end
