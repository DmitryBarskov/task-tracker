class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :title, length: { minimum: 20 }
  validates :deadline_at, presence: true
end
