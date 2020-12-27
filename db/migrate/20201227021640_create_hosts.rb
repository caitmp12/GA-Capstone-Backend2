class CreateHosts < ActiveRecord::Migration[6.0]
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :zipcode
      t.string :rate
      t.string :animals
      t.string :walker
      t.string :host
      t.string :grooming
      t.string :travel
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
