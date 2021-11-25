class CreateTask
  include Interactor::Organizer

  organize CreateTask::PrepareParams,
           CreateTask::SaveRecord
           # CreateTask::SendNotifications
end
