class CreateAllergens < ActiveRecord::Migration[7.0]
  def change
    create_table :allergens do |t|
      t.string :name
      t.jsonb :found_in, null: false, default: '{}'

      t.timestamps
    end
  end
end
