module Types
  class QueryType < Types::BaseObject
    field :project, resolver: Resolvers::Project
    field :projects, resolver: Resolvers::Projects
  end
end
