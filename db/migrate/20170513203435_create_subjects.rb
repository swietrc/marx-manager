class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.date :start_date
      t.date :finish_date
      t.integer :owner_id

      t.timestamps
    end
  end
end
