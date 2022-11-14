module Projects
  class Destroy
    include Interactor::Organizer

    organize Projects::Destroy::Execute,
             Projects::Destroy::SendNotification
  end
end
