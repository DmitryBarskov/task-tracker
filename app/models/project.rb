
class Project < ApplicationRecord
  belongs_to :user, optional: true

  has_and_belongs_to_many :users
  # has_many :projects_users, through: :project

  validates :name, presence: true

  scope :old, -> { where("created_at < ?", 1.day.ago) }
end
