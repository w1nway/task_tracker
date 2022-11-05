class AddStateToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :state, :string, null: false, default: "Not started"
  end
end
