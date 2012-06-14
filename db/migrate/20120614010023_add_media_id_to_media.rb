class AddMediaIdToMedia < ActiveRecord::Migration
  def change
    add_column :media, :code, :string
    add_index :media, :code, {name: 'media_code_index', unique: true}
  end
end
