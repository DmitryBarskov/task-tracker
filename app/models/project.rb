class Project < ApplicationRecord
  belongs_to :user, optional: true
  has_many :tasks
  has_many :activities, as: :target

  has_and_belongs_to_many :users

  validates :name, presence: true

  scope :old, -> { where("created_at < ?", 1.day.ago) }
end
