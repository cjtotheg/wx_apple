class CreateWxes < ActiveRecord::Migration[7.0]
  def change
    create_table :wxes do |t|
      t.string :street
      t.string :city
      t.string :state_or_province
      t.string :postal_code
      t.string :country

      t.timestamps
    end
  end
end
