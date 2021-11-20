class RegisterActivityJob < ApplicationJob
  def perform(user_id, kind, target_id, target_type)
    Activity.create!(user_id: user_id, kind: kind, target_type: target_type, target_id: target_id)
  end
end
