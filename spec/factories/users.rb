FactoryBot.define do
  factory :user do
    nickname {"ヤマ"}
    email {"test@mail.com"}
    password {"password"}
    password_confirmation {password}
    family_name {"山田"}
    first_name {"太郎"}
    family_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birthday {"1991-01-01"}
  end
end 