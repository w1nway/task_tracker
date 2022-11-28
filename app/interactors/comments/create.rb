module Comments
  class Create
    include Interactor::Organizer

    organize Comments::PrepareParams,
             Comments::Save
  end
end
