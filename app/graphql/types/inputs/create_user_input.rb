module Types
  module Inputs
    class CreateUserInput < Types::BaseInputObject
      argument :email, String, required: true
      argument :first_name, String, required: false
      argument :last_name, String, required: false
    end
  end
end