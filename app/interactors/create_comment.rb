class CreateComment

  include Interactor::Organizer

  organize CreateComment::SaveComment,
           CreateComment::SendNotifications
           
end