class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.string :salary
      t.text :description
      t.string :location
      t.references :employer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
