class CreateResumeSkills < ActiveRecord::Migration
  def change
    create_table :resume_skills do |t|
      t.references :resume, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
