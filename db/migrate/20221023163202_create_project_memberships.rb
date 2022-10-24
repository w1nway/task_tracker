class CreateProjectMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :project_memberships do |t|
      t.belongs_to :project
      t.belongs_to :user
      t.string :role, null: false

      t.timestamps
    end
  end
end
