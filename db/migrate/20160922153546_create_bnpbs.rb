class CreateBnpbs < ActiveRecord::Migration[5.0]
  def change
    create_table :bnpbs do |t|
      t.date :tanggal
      t.references :bencana, foreign_key: true
      t.references :kabupaten, foreign_key: true
      t.integer :korban_meninggal
      t.integer :korban_hilang
      t.integer :korban_luka
      t.integer :korban_mengungsi

      t.timestamps
    end
  end
end
