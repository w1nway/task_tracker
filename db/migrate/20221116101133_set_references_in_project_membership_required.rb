class SetReferencesInProjectMembershipRequired < ActiveRecord::Migration[6.1]
  def change
    change_column_null :project_memberships, :project_id, false
    change_column_null :project_memberships, :user_id, false
  end
end
