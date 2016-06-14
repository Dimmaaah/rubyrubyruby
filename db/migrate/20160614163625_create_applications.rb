class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
