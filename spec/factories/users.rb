FactoryBot.define do
  factory :user do
    region
    first_name { "Akif" }
    last_name { "Test" }
    email { "test@servas.dev" }
    password { "password123" }
    role { "interviewer" }
  end
end