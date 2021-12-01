class CreateComment
  include Interactor::Organizer

  organize CreateComment::PrepareParams,
           CreateComment::SaveRecord
end


