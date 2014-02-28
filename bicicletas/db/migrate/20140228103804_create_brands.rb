class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.text :name
      t.text :history
      t.string :localizacion

      t.timestamps
    end
  end
end
