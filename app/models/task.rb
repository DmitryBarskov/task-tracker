class Task < ApplicationRecord
  belongs_to :project

  validates :titile, presence: true
  #validates :title, lenght: { minimum:20 }
  #validates :deadline_at, presence: true
end
