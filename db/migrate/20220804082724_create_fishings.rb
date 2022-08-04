class CreateFishings < ActiveRecord::Migration[6.0]
  def change
    create_table :fishings do |t|
      t.date :day, null: false
      t.string :name, null: false
      t.integer :size, null: false
      t.integer :count, null: false
      t.integer :field_id, null: false
      t.string :memo, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
