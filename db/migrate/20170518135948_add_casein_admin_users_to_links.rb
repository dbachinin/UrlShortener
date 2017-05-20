class AddCaseinAdminUsersToLinks < ActiveRecord::Migration[5.0]
  def change
    add_reference :links, :casein_admin_users, foreign_key: true
  end
end
