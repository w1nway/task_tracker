module Projects
  class Create
    include Interactor::Organizer

    # organize Projects::Save,
    #          Projects::Create::CreateOwner,
    #          Projects::Create::SendNotification

    organize Projects::Save,
             Projects::Create::PrepareParams
  end
end
