FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'bizcliz4life'}
    password_confirmation {"bizcliz4life"}
    last_name             {'山田'}
    first_name            {"太郎"}  
    last_name_kana        {'ヤマダ'}
    first_name_kana       {"タロウ"}
    birthday              {"1993/1/1"}  
  end
end
