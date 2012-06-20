class AddUserAgentToReferrer < ActiveRecord::Migration
  def change
    add_column :referrers, :user_agent, :string
  end
end
