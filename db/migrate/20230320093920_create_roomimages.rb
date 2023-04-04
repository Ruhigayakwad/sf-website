class CreateRoomimages < ActiveRecord::Migration[7.0]
  def change
    create_table :roomimages do |t|
      t.string :name
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
