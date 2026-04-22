FactoryBot.define do
  factory :booking do
    availability
    association :booker, booker_type: "member", region: nil
    start_time { "11:00" }
    duration { 30 }
    interview_type { "video" }
    status { "pending" }
  end
end