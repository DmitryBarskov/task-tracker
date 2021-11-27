class UpdateComment
  include Interactor::Organizer

  organize UpdateComment::PrepareParams,
           UpdateComment::SaveRecord
           # UpdateComment::SendNotifications
end