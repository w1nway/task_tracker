module Types
  module Inputs
    class DestroyCommentInput < Types::BaseInputObject
      argument :id, ID, required: true
    end
  end
end
