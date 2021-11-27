class UpdateProject
  include Interactor::Organizer

  organize UpdateProject::PrepareParams,
           UpdateProject::UpdateRecord,
           UpdateProject::SendNotifications
end
