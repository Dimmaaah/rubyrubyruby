class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :street
      t.string :postcode
      t.string :city
      t.string :country
      t.string :phone

      t.timestamps null: false
    end
  end
end
