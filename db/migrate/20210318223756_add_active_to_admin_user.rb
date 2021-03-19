class AddActiveToAdminUser < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :active, :boolean, default: true
  end
end
