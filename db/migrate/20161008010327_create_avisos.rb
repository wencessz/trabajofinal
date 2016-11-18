class CreateAvisos < ActiveRecord::Migration[5.0]
  def change
    create_table :avisos do |t|
      t.string :title
      t.text :description
      t.boolean :active

      t.timestamps

      t.belongs_to :user, index: true
    end
  end
end
