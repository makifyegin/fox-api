FactoryBot.define do
  factory :availability do
    user
    date {Date.tomorrow}
    start_time {"11:00"}
    end_time {"12:00"}
  end
end