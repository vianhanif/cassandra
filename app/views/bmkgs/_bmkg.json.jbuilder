json.extract! bmkg, :id, :tanggal, :suhu_min, :suhu_max, :suhu_rata, :kelembaban_rata, :curah_hujan, :lama_penyinaran, :created_at, :updated_at
json.url bmkg_url(bmkg, format: :json)