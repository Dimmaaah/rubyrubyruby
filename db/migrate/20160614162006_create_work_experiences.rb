class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.date :start_date
      t.date :end_date
      t.string :company_name
      t.string :job_title
      t.text :description
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
