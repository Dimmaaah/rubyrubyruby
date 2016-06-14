class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :phone
      t.text :summary
      t.string :linkedin
      t.integer :years_of_experience
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
