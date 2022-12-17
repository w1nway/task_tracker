module Types
  module Inputs
    class UpdateCommentInput < Types::BaseInputObject
      argument :comment_id, ID, required: true
      argument :content, String, required: true
    end
  end
end
