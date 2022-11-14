module Tasks
  class Destroy
    include Interactor::Organizer

    organize Tasks::Destroy::Execute,
             Tasks::Destroy::SendNotification
  end
end
