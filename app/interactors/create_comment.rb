class CreateComment
  include Interactor::Organizer

  organize CreateComment::SaveRecord
           # CreateComment::SendNotifications
end
