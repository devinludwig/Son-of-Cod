class AddProductsAndRemoveAccidentallyCreatedTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :initial_schemas
    create_table :products do |t|
      t.string "name"
      t.string "description"
      t.decimal "price"
    end
  end
end
