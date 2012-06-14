class AddUserIdToReferrer < ActiveRecord::Migration
  def change
    add_column :referrers, :user_id, :integer
  end
end
