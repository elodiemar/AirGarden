class CreateGardens < ActiveRecord::Migration[7.0]
  def change
    create_table :gardens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :size
      t.integer :capacity
      t.text :description
      t.integer :price_per_hour

      t.timestamps
    end
  end
end
