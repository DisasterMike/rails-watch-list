class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :overview
      t.string :poster_url
      t.integer :rating, default: 0

      t.timestamps
    end
  end
end
