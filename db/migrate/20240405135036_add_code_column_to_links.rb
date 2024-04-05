class AddCodeColumnToLinks < ActiveRecord::Migration[7.0]
  def change
    add_index :links, :code, unique: true
  end
end
