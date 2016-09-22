class CreateSosialmedias < ActiveRecord::Migration[5.0]
  def change
    create_table :sosialmedias do |t|
      t.date :tanggal
      t.string :link
      t.references :bencana, foreign_key: true

      t.timestamps
    end
  end
end
