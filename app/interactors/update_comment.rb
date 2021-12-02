class UpdateComment
  include Interactor::Organizer

  organize UpdateComment::SaveRecord
           # UpdateComment::SendNotifications
end
