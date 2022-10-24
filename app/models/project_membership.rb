class ProjectMembership < ApplicationRecord
  extend Enumerize

  ROLES = %i[owner member].freeze

  belongs_to :project
  belongs_to :user

  enumerize :role, in: ROLES
end
