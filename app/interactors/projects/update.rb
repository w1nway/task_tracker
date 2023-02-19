module Projects
  class Update
    include Interactor::Organizer

    organize Projects::Update::Execute
  end
end
