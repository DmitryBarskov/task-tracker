class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :task
  belongs_to :project, :through => :task

end
