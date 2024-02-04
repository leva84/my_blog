FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    summary { Faker::Lorem.paragraph }
    content { Faker::Lorem.paragraphs.join("\n\n") }
  end
end
