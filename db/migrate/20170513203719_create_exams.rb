class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.date :date
      t.integer :subject_id

      t.timestamps
    end

    create_table :subjects_students, id: false do |t|
      t.integer :user_id
      t.integer :subject_id
      t.timestamps
    end
  end

  
end
