class AddDefaultToRedirect < ActiveRecord::Migration
  def change
    add_column :redirects, :default_redirect, :boolean
  end
end
