class CreatePolas < ActiveRecord::Migration[5.0]
  def change
    create_table :polas do |t|
      t.references :bnpb, foreign_key: true
      t.integer :h1
      t.integer :h2
      t.integer :h3
      t.integer :h4
      t.integer :h5
      t.integer :h6
      t.integer :h7
      t.integer :polanya
      t.integer :keterangan

      t.timestamps
    end
  end
end
