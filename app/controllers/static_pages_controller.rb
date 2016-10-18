class StaticPagesController < ApplicationController
  include Ramalan
  def home
  end

  def informasi
  end

  def data
  end

  def ramalan
    @hasil = ramal(params[:provinsi], params[:bulan]) if params[:provinsi] && params[:bulan]
  end

  def info
  end

  def about
  end
end
