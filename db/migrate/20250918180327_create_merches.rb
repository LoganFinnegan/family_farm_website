class CreateMerches < ActiveRecord::Migration[7.2]
  def change
    create_table :merches do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :stock

      t.timestamps
    end
  end
end
