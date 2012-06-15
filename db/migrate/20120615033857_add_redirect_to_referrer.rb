class AddRedirectToReferrer < ActiveRecord::Migration
  def change
    add_column :referrers, :redirect_id, :integer
  end
end
