class CreateCommunicates < ActiveRecord::Migration[5.0]
  def change
    create_table :communicates do |t|
      t.text :message
      t.integer :sender_id
      t.integer :publisher_id
      t.integer :aviso_id
      t.timestamps
    end
  end
end
