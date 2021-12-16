class UpdateComment
  include Interactor::Organizer

  organize UpdateComment::UpdateRecord, UpdateComment::SendNotifications
end