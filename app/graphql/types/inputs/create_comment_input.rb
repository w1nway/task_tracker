module Types
  module Inputs
    class CreateCommentInput < Types::BaseInputObject
      argument :content, String, required: true
      argument :task_id, Integer, required: true
    end
  end
end
