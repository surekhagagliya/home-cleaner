class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_role, :string
  end
end
