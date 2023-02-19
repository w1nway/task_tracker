module Projects
  class Destroy
    include Interactor::Organizer

    organize Projects::Destroy::Execute
  end
end
