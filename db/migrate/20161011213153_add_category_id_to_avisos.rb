class AddCategoryIdToAvisos < ActiveRecord::Migration[5.0]
  def change
    add_column :avisos, :category_id, :integer
  end
end
