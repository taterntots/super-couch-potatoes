class CreateMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :media do |t|
      t.string :title
      t.integer :rating
      t.date :date_completed
      t.string :media_type
      t.boolean :first_time
      t.string :img_URL
      t.integer :user_id

      t.timestamps
    end
    add_index :media, :user_id
  end
end
