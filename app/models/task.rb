class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :deadline_at, presence: true
  validate :deadline_possibility

  private

  def deadline_possibility
    return if (created_at || Time.current) < deadline_at

    errors.add(:deadline_at, "must be after creation time")
  end
end
