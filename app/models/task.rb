class Task < ApplicationRecord
	belongs_to :project

	validates :title, presence: true
	validates :deadline_at, presence: true
	validates :project, presence: true

	validate :deadline_at_after_created_at
	# validates_with MyValidator

	def deadline_at_after_created_at
		return if (created_at || Time.current) < deadline_at

		errors.add(:deadline_at, "must be after the date of")
	end
end


# class MyValidator < ActiveModel::EachValidator
# 	def validate_each(record, attribute, value)
# 		tasks = Task.where(["task_id = ?", record.task_id])
# 		date_ranges = tasks.map { |t| t.created_at..t.deadline_at }

# 		date_ranges.each do |range|
# 			if range.include? value
# 				record.errors.add(attribute, "not available")
# 			end
# 		end
# 	end
# end