class RemoveActiveFromAdminUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :admin_users, :active, :boolean
  end
end
