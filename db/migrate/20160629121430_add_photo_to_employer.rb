class AddPhotoToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :photo, :string
  end
end
