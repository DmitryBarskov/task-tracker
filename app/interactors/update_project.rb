class UpdateProject
  include Interactor::Organizer

  organize UpdateProject::UpdateRecord,
           UpdateProject::SendNotifications
end

