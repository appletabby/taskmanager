FactoryBot.define do
  factory :task do
    sequence(:content) { |n| "task content #{n}" }
    sequence(:priority) { |n| I18n.t('model.priority.high') || I18n.t('model.priority.medium') || I18n.t('model.priority.low')}
  end	  
end