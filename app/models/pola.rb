class Pola < ApplicationRecord
  belongs_to :bnpb
  enum polanya: { trend_naik: 1, stationary: 2, trend_turun: 3, random: 4}
  enum keterangan: { twitter: 1, suhu_rata: 2, kelembaban_rata: 3, curah_hujan: 4}
end
