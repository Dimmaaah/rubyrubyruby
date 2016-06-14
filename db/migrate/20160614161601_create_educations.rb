class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :name
      t.string :school
      t.date :start_date
      t.date :end_date
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
