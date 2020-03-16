class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.integer :dni
      t.date :birthday

      t.timestamps
    end
  end
end
