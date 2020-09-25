FactoryBot.define do
  factory :furima_app do
    number        { 4242424242424242 }
    exp_month     { 1 }
    exp_year      { 23 }
    cvc           { 123 }
    post_code     { '111-1111' }
    prefecture_id { 2 }
    city          { '東京都' }
    address       { '新宿1-1' }
    building_name { '新宿マンション' }
    phone_number  { '09012345678' }
  end
end