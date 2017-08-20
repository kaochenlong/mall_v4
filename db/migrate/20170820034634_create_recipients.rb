class CreateRecipients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.string :email
      t.text :note
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
