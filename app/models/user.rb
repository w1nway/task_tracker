class User < ApplicationRecord
  extend Enumerize

  ROLES = %i[member admin superadmin].freeze

  has_secure_password

  has_many :project_memberships, dependent: :restrict_with_error
  has_many :projects, through: :project_memberships
  has_many :comments, dependent: :destroy

  enumerize :role, in: ROLES, scope: :shallow, predicates: true

  validates :email, presence: true, uniqueness: true
end
