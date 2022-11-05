class ChangeTasksStateDefault < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :state, :string, null: false, default: "not_started"
  end
end
