class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :upc_code
      t.string :ingredients, array: true, default: []
      t.string :allergens, array: true, default: []
      t.boolean :lily_eat

      t.timestamps
    end
  end
end
