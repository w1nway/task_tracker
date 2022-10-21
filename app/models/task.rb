class Task < ApplicationRecord
	belongs_to :project

	validates :title, presence: true
	validates :deadline_at, presence: true
	validates :project, presence: true

	validate :deadline_at_after_created_at


	def deadline_at_after_created_at
		return if (created_at || Time.current) < deadline_at

		errors.add(:deadline_at, "must be after creation time")
	end
end

