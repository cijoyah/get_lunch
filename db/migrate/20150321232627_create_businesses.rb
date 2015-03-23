class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :postcode
      t.string :website
      t.string :tel
      t.string :facebook
      t.string :twitter

      t.timestamps null: false
    end
  end
end
