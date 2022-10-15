FactoryBot.define do
  factory :tweet do
    title          { Faker::Lorem.word }
    place          { Faker::Lorem.word }
    introduction   { Faker::Lorem.sentence }
    
    association :user
    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/test_image.jpeg'), filename: "test_image.jpeg")
    end
  end
end
