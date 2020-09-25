FactoryBot.define do
  factory :furima_app do
    token         {'IH4qzpA31pB7bwUqag6ViqQwgBCgF9n8'}
    post_code     { '111-1111' }
    prefecture_id { 2 }
    city          { '東京都' }
    address       { '新宿1-1' }
    phone_number  { '09012345678' }
  end
end