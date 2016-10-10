class CreatePolds < ActiveRecord::Migration[5.0]
  def change
    create_table :polds do |t|
      t.integer :h1
      t.integer :h2
      t.integer :h3
      t.integer :h4
      t.integer :h5
      t.integer :h6
      t.integer :h7
      t.integer :pola
      t.integer :keterangan

      t.timestamps
    end
  end
end
