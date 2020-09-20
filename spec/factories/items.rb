FactoryBot.define do
  factory :item do
    name                  {"テスト商品"}
    description           {"説明文です"}
    category_id         {2}
    status_id           {2}
    delivery_cost_id    {2}
    prefecture_id       {2}
    day_id              {2}
    price               {500}
      association :user
  end
end
