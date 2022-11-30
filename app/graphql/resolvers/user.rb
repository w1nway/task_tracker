module Resolvers
  class User < Resolvers::Base
    argument :id, ID, required: true

    type Types::UserType, null: true

    def resolve(**options)
      ::User.find_by(id: options[:id])
    end
  end
end
