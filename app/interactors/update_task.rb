class UpdateTask
  include Interactor::Organizer

  organize UpdateTask::UpdateRecord,
           UpdateTask::SendNotifications
end
