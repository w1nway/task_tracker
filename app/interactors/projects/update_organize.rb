module Projects
  class Update
    include Interactor::Organizer

    organize Projects::Update::Execute,
             Projects::Update::SendNotification
  end
end
