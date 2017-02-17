class AddReviewTable < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer 'product_id'
      t.string 'content'
    end
  end
end
