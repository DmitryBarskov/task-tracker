class UpdateProject
  include Interactor::Organizer

  organize UpdateProject::PrepareParams,
           UpdateProject::SaveRecord
           # UpdateProject::SendNotifications
end