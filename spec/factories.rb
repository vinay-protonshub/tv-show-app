FactoryBot.define do
  factory :favorite do
    show_id 1
    user_id 1
  end
  factory :favorite do
    show_id 1
    user_id ""
  end

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    username { Faker::Name.name }
  end

  factory :watchlist do
    name { Faker::Hipster.sentence(3) }
    description { Faker::Hipster.sentence }
    association :user, factory: :user
  end

  factory :show do
    title { Faker::Book.title }
    description { Faker::Hipster.sentence }
    association :channel, factory: :channel
    day "Mon"
    time "9:00 PM"
    current_season { Faker::Number.between(10, 20) }
  end

  factory :channel do
    name "ABC"
  end

  factory :genre do
    name { Faker::Book.genre }
  end

  factory :listing do
    association :watchlist, factory: :watchlist
    association :show, factory: :show
    association :user, factory: :user
    user_status "Not Started"
    user_season { Faker::Number.between(1, 10) }
  end
end
