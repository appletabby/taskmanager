class Task < ApplicationRecord
    enum priority: { high: 1, medium: 2, low: 3 }
    enum status: { to_do: 1, in_progress: 2, done: 3 }
end
