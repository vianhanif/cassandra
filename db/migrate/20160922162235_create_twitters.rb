class CreateTwitters < ActiveRecord::Migration[5.0]
  def change
    create_table :twitters do |t|
      t.date :tanggal
      t.text :post
      t.references :bencana, foreign_key: true

      t.timestamps
    end
  end
end
