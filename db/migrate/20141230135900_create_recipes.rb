class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :veggie1
      t.string :veggie2
      t.string :fruit1
      t.string :fruit2
      t.string :image    

      t.timestamps null: false
    end
  end
end
