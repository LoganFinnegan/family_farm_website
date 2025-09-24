class RenameMerchesToProducts < ActiveRecord::Migration[7.2]
   def change
    rename_table :merches, :products
  end
end
