class CreateProject
  include Interactor::Organizer

  organize CreateProject::PrepareParams,
           CreateProject::SaveRecord,
           CreateProject::SendNotifications
end
