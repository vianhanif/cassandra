class CreateBmkgs < ActiveRecord::Migration[5.0]
  def change
    create_table :bmkgs do |t|
      t.date :tanggal
      t.float :suhu_min
      t.float :suhu_max
      t.float :suhu_rata
      t.integer :kelembaban_rata
      t.float :curah_hujan
      t.integer :lama_penyinaran

      t.timestamps
    end
  end
end
