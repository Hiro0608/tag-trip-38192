FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    last_name             {"苗字"}
    first_name            {"名前"}
    last_name_kana        {"ミョウジ"}
    first_name_kana       {"ナマエ"}
    email                 { Faker::Internet.unique.email }
    birthday              { Faker::Date.birthday }
    password              { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
  end
end
