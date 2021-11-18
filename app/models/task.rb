class Task < ApplicationRecord
  ALLOWED_STATUSES = %w[not_started started finished]

  belongs_to :project
  has_many :comments

  validates :title, presence: true
  validates :title, length: { minimum: 20 }
  validates :deadline_at, presence: true
  validates :status, inclusion: { in: ALLOWED_STATUSES }
end
