class AddCodeToTarget < ActiveRecord::Migration
  def change
    add_column :targets, :code, :string
    add_index :targets, :code, {name: 'target_code_index', unique: true}
  end
end
