module Users
  class Create
    include Interactor::Organizer

    organize Users::Save,
             Users::GenerateAccessToken
  end
end
