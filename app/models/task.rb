class Task < ApplicationRecord
  extend Enumerize

  STATUSES = %i[not_started started finished].freeze
  
  enumerize :status, in: STATUSES, scope: :shallow, predicates: true

  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :deadline_at, presence: true
  validate :deadline_possibility

  private

  def deadline_possibility
    return if (created_at || Time.current) < deadline_at

    errors.add(:deadline_at, "must be after creation time")
  end
end
