class CreateUserdetails < ActiveRecord::Migration[7.0]
  def change
    create_table :userdetails do |t|
      t.string :name
      t.string :phoneno
      t.string :email

      t.timestamps
    end
  end
end
