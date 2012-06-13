class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :category
      t.string :title
      t.date :start_date
      t.date :end_date
      t.integer :cost
      t.integer :copies

      t.timestamps
    end
  end
end
