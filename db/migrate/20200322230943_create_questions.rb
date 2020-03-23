class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :text
      t.references :task, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
