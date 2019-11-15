FactoryBot.define do
  factory :task do
    sequence(:content) { |n| "task content #{n}" }
    sequence(:priority) { |n| "high" || "medium" || "low"}
  end	  
end