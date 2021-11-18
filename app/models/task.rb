class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :deadline_at, presence: true
end
