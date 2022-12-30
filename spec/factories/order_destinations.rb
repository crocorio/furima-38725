FactoryBot.define do
  factory :order_destination do
    city { '京都市' }
    block { '玉屋町' }
    phone_number { '08046472447' }
    postal_code { '600-8809' }
    token { 'tok_abcdefghijk00000000000000000' }
    prefecture_id { 2 }
    building { 'ライオンズマンション' }
  end
end
