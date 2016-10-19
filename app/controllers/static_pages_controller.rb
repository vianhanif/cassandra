class StaticPagesController < ApplicationController

  def home
  end

  def informasi
  end

  def data
    list_bnpb = [];
    if params[:provinsi] and params[:kabupaten] and params[:awal_tanggal] and params[:awal_bulan] and params[:awal_tahun] and params[:akhir_tanggal] and params[:akhir_bulan] and params[:akhir_tahun]
      awal_tanggal = params[:awal_tanggal][:id]
      awal_bulan = set_bulan(params[:awal_bulan][:id])
      awal_tahun = params[:awal_tahun][:id]
      akhir_tanggal = params[:akhir_tanggal][:id]
      akhir_bulan = set_bulan(params[:akhir_bulan][:id])
      akhir_tahun = params[:akhir_tahun][:id]

      provinsi = params[:provinsi][:id]
      kabupaten = params[:kabupaten][:id]
      Bnpb.all.each do |bnpb|
        if bnpb.kabupaten.id.to_s == kabupaten.to_s and bnpb.kabupaten.provinsi.id.to_s == provinsi
          if bnpb.tanggal.strftime("%d").to_s >= awal_tanggal.to_s and bnpb.tanggal.strftime("%d").to_s <= akhir_tanggal.to_s and bnpb.tanggal.strftime("%m").to_s >= awal_bulan.to_s and bnpb.tanggal.strftime("%m").to_s <= akhir_bulan.to_s and bnpb.tanggal.strftime("%Y").to_s >= awal_tahun.to_s and bnpb.tanggal.strftime("%Y").to_s <= akhir_tahun.to_s
            list_bnpb.push(bnpb)
          end
        end
      end
    else
      list_bnpb = Bnpb.all;
    end
    @bnpbs = list_bnpb.paginate(page: params[:page], per_page: 10)
  end

  def ramalan
  end

  def info
  end

  def about
  end

  private
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
end
