class Task < ApplicationRecord
    enum priority: { high: 1, medium: 2, low: 3 }
    enum status: { to_do: 1, in_progress: 2, done: 3 }
    # validates :priority, inclusion: { in: %w(high medium low),
    #   message: "%{value} is not a valid priority." }
    # validates :status, inclusion: { in: %w(to_do in_progress done),
    #   message: "%{value} is not a valid status." }
end
