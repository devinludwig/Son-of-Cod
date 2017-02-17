class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    drop_table :products
    create_table :products do |t|
      t.string "name"
      t.string "description"
      t.decimal "price"
      t.timestamps
    end
  end
end
