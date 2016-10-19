module Ramalan
  def ramal(provinsinya,bulannya)
  	hasil_h = []
  	ramalan = []

  	Bencana.all.each do |bencananya|
  		# provinsi_h = Bnpb.where("provinsi_id= ? AND bencana_id= ?", provinsinya, bulannya).count
      kabupaten_ids = "SELECT kabupaten_id FROM kabupatens WHERE provinsi_id = ?"
      provinsi_h = Bnpb.where("kabupaten_id IN (#{kabupaten_ids}) AND bencana_id= ?", provinsinya, bencananya).count
    	bulan_h = Bnpb.where("extract(month from tanggal) = ? AND bencana_id= ?", bulannya, bencananya).count
  		bencana_h = Bnpb.where("bencana_id= ?", bencananya).count
  		bencana_tot = Bnpb.all.count
  		polarray = []
  		# Keterangan.all.each do |keterangannya|
  			# Polanya.all.each do |polapolanya|
      if (bencana_h > 0 && bulan_h > 0 && bencana_h > 0)
        Pola.keterangans.values.each do |keterangannya|
          Pola.polanyas.values.each do |polapolanya|
            bnpb_ids = "SELECT bnpb_id FROM bnpbs WHERE bencana_id = ?"
            jumlah_pola = Pola.where("bnpb_id IN (#{bnpb_ids}) AND keterangan = ? AND polanya = ?", bencananya, keterangannya, polapolanya).count
            polarray << jumlah_pola
          end
    		end
        # byebug
    		for i in 0..3
    			for ii in 4..7
    				for iii in 8..11
              # hasil_h << (provinsi_h * bulan_h * polarray[i] * polarray[ii] * polarray [iii] *bencana_h) / ( bencana_h * bencana_h * bencana_h * bencana_h * bencana_h * bencana_tot)
              if (polarray[i] > 0 && polarray[ii] > 0 && polarray[iii] > 0)
                atas = provinsi_h * bulan_h * polarray[i] * polarray[ii] * polarray [iii] *bencana_h
                bawah = bencana_h * bencana_h * bencana_h * bencana_h * bencana_h * bencana_tot
                hasil_h << atas.to_f / bawah.to_f
                # byebug
                ramalan << bencananya
                # byebug
              end
    				end
    			end
    		end
      end
    end
  	indeks_hasil = hasil_h.max
  	hasil_ramalan =ramalan[indeks_hasil]
  end

end
