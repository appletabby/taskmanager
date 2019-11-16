class Task < ApplicationRecord
    enum priority: { I18n.t('model.priority.high')=> 1, I18n.t('model.priority.medium')=> 2, I18n.t('model.priority.low')=> 3 }
    enum status: { I18n.t('model.status.to_do')=> 1, I18n.t('model.status.in_progress')=> 2, I18n.t('model.status.done')=> 3 }
    # validates :priority, inclusion: { in: %w(high medium low),
    #   message: "%{value} is not a valid priority." }
    # validates :status, inclusion: { in: %w(to_do in_progress done),
    #   message: "%{value} is not a valid status." }
end
