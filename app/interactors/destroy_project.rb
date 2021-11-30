class DestroyProject
  include Interactor::Organizer

  organize DestroyProject::SendNotifications,
           DestroyProject::DestroyRecord
end
