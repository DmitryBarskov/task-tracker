class Task < ApplicationRecord
  ALLOWED_STATUSES = ["not_started", "started", "finished"]

  belongs_to :project

  has_many :comments, dependent: :delete_all

  validates :title, presence: true
  validates :title, length: { minimum: 5 }
  validates :deadline_at, presence: true
  validates :status, inclusion: { in: ALLOWED_STATUSES }
end
