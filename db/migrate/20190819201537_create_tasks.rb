class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :titulo
      t.text :descripcion
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
