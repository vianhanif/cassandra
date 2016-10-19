module StaticPagesHelper

  def set_bulan(_bulan)
    list_bulan  = [['Januari', 1],['Februari', 2],['Maret', 3],['April', 4],['Mei', 5],['Juni', 6],['Juli', 7],['Agustus', 8],['September', 9],['Oktober', 10],['November', 11],['Desember', 12]];
    pilihan = 0;
    list_bulan.each do |bulan|
      if bulan[0] == _bulan
        pilihan = bulan[1]
      end
    end
    pilihan
  end

  def ramal(provinsinya,bulannya)
  	hasil_h = []
  	ramalan = []

  	Bencana.all.each do |bencananya|
      kabupaten_ids = "SELECT kabupaten_id FROM kabupatens WHERE provinsi_id = ?"
      provinsi_h = Bnpb.where("kabupaten_id IN (#{kabupaten_ids}) AND bencana_id= ?", provinsinya, bencananya).count
    	bulan_h = Bnpb.where("extract(month from tanggal) = ? AND bencana_id= ?", bulannya, bencananya).count
  		bencana_h = Bnpb.where("bencana_id= ?", bencananya).count
  		bencana_tot = Bnpb.all.count
  		polarray = []
      Pola.keterangans.values.each do |keterangannya|
        Pola.polanyas.values.each do |polapolanya|
          bnpb_ids = "SELECT bnpb_id FROM bnpbs WHERE bencana_id = ?"
          jumlah_pola = Pola.where("bnpb_id IN (#{bnpb_ids}) AND keterangan = ? AND polanya = ?", bencananya, keterangannya, polapolanya).count
          polarray << jumlah_pola
      	end
  		end

  		for i in 0..3
  			for ii in 4..7
  				for iii in 8..11
            if bencana_h != 0
  					  hasil_h << (provinsi_h * bulan_h * polarray[i] * polarray[ii] * polarray [iii] *bencana_h) / ( bencana_h * bencana_h * bencana_h * bencana_h * bencana_h * bencana_tot)
            else
              hasil_h << 0
            end
            ramalan << bencananya
  				end
  			end
  		end
      # byebug
  	end

  	indeks_hasil = hasil_h.max

  	hasil_ramalan =ramalan[indeks_hasil]
  end

end
