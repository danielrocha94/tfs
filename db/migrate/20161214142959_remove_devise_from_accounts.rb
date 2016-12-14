class RemoveDeviseFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :encrypted_password
    remove_column :accounts, :reset_password_token
    remove_column :accounts, :reset_password_sent_at
    remove_column :accounts, :remember_created_at
    remove_column :accounts, :sign_in_count
    remove_column :accounts, :current_sign_in_at
    remove_column :accounts, :last_sign_in_at
    remove_column :accounts, :current_sign_in_ip
    remove_column :accounts, :last_sign_in_ip
  end
end
