class SosialmediasController < ApplicationController
  before_action :set_sosialmedia, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:import, :new, :create, :edit, :update, :destroy, :report]

  def import
    Sosialmedia.import(params[:file])
    redirect_to sosialmedias_path, notice: "Sosial Media imported."
  end

  # GET /sosialmedias
  # GET /sosialmedias.json
  def index
    @sosialmedias = Sosialmedia.all.paginate(page: params[:page], per_page: 30)
  end

  # GET /sosialmedias/1
  # GET /sosialmedias/1.json
  def show
  end

  # GET /sosialmedias/new
  def new
    @sosialmedia = Sosialmedia.new
  end

  # GET /sosialmedias/1/edit
  def edit
  end

  # POST /sosialmedias
  # POST /sosialmedias.json
  def create
    @sosialmedia = Sosialmedia.new(sosialmedia_params)

    respond_to do |format|
      if @sosialmedia.save
        format.html { redirect_to @sosialmedia, notice: 'Sosialmedia was successfully created.' }
        format.json { render :show, status: :created, location: @sosialmedia }
      else
        format.html { render :new }
        format.json { render json: @sosialmedia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sosialmedias/1
  # PATCH/PUT /sosialmedias/1.json
  def update
    respond_to do |format|
      if @sosialmedia.update(sosialmedia_params)
        format.html { redirect_to @sosialmedia, notice: 'Sosialmedia was successfully updated.' }
        format.json { render :show, status: :ok, location: @sosialmedia }
      else
        format.html { render :edit }
        format.json { render json: @sosialmedia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sosialmedias/1
  # DELETE /sosialmedias/1.json
  def destroy
    @sosialmedia.destroy
    respond_to do |format|
      format.html { redirect_to sosialmedias_url, notice: 'Sosialmedia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sosialmedia
      @sosialmedia = Sosialmedia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sosialmedia_params
      params.require(:sosialmedia).permit(:tanggal, :link, :bencana_id)
    end
end
