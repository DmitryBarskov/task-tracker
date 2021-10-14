# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :title, length: { minimum: 5 }
  validates :deadline_at, presence: true
end
