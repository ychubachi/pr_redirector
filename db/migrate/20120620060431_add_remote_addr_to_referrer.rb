class AddRemoteAddrToReferrer < ActiveRecord::Migration
  def change
    add_column :referrers, :remote_addr, :string
  end
end
