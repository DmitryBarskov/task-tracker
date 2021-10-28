class Comment < ApplicationRecord
  belongs_to :project

  validates :content, presence: true

  belongs_to :user
  belongs_to :task
end
