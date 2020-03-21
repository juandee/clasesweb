class CreateAttendants < ActiveRecord::Migration[5.2]
  def change
    create_table :attendants do |t|
      t.references :pupil, class_name: "User", foreign_key: true
      t.references :course, foreign_key: true
      t.timestamps
    end
  end
end
