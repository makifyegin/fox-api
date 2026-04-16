
FactoryBot.define do
  factory :booker do
    name { "John" }
    email { "john@servas.dev" }
    booker_type { "applicant" }
    region
  end

end