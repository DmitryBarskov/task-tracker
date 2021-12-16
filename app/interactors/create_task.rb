class CreateTask
  include Interactor::Organizer

  organize CreateTask::SaveTask,
           CreateTask::SendNotifications
           
end