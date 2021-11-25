class UpdateTask
  include Interactor::Organizer

  organize UpdateTask::PrepareParams,
           UpdateTask::SaveRecord
           # UpdateTask::SendNotifications
end