class CreateRedirects < ActiveRecord::Migration
  def change
    create_table :redirects do |t|
      t.integer :medium_id
      t.integer :target_id

      t.timestamps
    end
  end
end
