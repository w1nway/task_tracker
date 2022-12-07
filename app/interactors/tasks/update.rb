module Tasks
  class Update
    include Interactor::Organizer

    organize Tasks::Update::Execute,
             Tasks::Update::SendNotification
  end
end
