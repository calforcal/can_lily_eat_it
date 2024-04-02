class CreateUserAllergens < ActiveRecord::Migration[7.0]
  def change
    create_table :user_allergens do |t|
      t.references :user, null: false, foreign_key: true
      t.references :allergen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
