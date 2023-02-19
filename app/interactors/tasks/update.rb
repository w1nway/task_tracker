module Tasks
  class Update
    include Interactor::Organizer

    organize Tasks::Update::Execute
  end
end
