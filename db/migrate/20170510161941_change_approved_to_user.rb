class ChangeApprovedToUser < ActiveRecord::Migration[5.0]
  def change
        change_column :users, :approved, :boolean, :default => :false, :null => false
  end
end
