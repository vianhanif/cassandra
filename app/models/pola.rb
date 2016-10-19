class Pola < ApplicationRecord
  belongs_to :bnpb
  enum polanya: { trend_naik: 1, stationary: 2, trend_turun: 3, random: 4}
  enum keterangan: { suhu_rata: 2, kelembaban_rata: 3, curah_hujan: 4}

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Pola.find_or_create_by! row.to_hash
    end
  end
end
