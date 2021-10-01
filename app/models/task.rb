class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :title, length: { minimum: 5}
end
