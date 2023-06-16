FactoryBot.define do
  factory :article do
    title { "Sample Article" }
    body { "This is a sample article." }
    association :user
  end
end
