class CreateTools < ActiveRecord::Migration[6.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.string :category
      t.string :sub_category
      t.text :description
      t.boolean :available, default: true
      t.integer :daily_price
      t.integer :condition
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
