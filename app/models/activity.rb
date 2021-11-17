class Activity < ApplicationRecord
  ALLOWED_KINDS = ["project_created"]

  belongs_to :user
  belongs_to :target, polymorphic: true

  validates :user_id, presence: true
  validates :kind, inclusion: { in: ALLOWED_KINDS }
end
