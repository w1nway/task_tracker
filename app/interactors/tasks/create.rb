module Tasks
  class Create
    include Interactor::Organizer

    organize Tasks::PrepareParams,
             Tasks::Save,
             Tasks::Create::SendNotification
  end
end
