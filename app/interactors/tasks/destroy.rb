module Tasks
  class Destroy
    include Interactor::Organizer

    organize Tasks::Destroy::Execute
  end
end
