module Resolvers
  class Users < Resolvers::Base
    type [Types::UserType], null: false

    def resolve(**_options)
      ::User.all
    end
  end
end
