class CreateReferrers < ActiveRecord::Migration
  def change
    create_table :referrers do |t|
      t.string :title

      t.timestamps
    end
  end
end
