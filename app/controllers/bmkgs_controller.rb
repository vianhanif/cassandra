class BmkgsController < ApplicationController
  before_action :set_bmkg, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, only:[:import, :new, :create, :edit, :update, :destroy, :report]

  def import
    Bmkg.import(params[:file])
    redirect_to bmkgs_path, notice: "BMKG imported."
  end
  # GET /bmkgs
  # GET /bmkgs.json
  def index
    @bmkgs = Bmkg.all.paginate(page: params[:page], per_page: 30)
  end

  # GET /bmkgs/1
  # GET /bmkgs/1.json
  def show
  end

  # GET /bmkgs/new
  def new
    @bmkg = Bmkg.new
  end

  # GET /bmkgs/1/edit
  def edit
  end

  # POST /bmkgs
  # POST /bmkgs.json
  def create
    @bmkg = Bmkg.new(bmkg_params)

    respond_to do |format|
      if @bmkg.save
        format.html { redirect_to @bmkg, notice: 'Bmkg was successfully created.' }
        format.json { render :show, status: :created, location: @bmkg }
      else
        format.html { render :new }
        format.json { render json: @bmkg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bmkgs/1
  # PATCH/PUT /bmkgs/1.json
  def update
    respond_to do |format|
      if @bmkg.update(bmkg_params)
        format.html { redirect_to @bmkg, notice: 'Bmkg was successfully updated.' }
        format.json { render :show, status: :ok, location: @bmkg }
      else
        format.html { render :edit }
        format.json { render json: @bmkg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bmkgs/1
  # DELETE /bmkgs/1.json
  def destroy
    @bmkg.destroy
    respond_to do |format|
      format.html { redirect_to bmkgs_url, notice: 'Bmkg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bmkg
      @bmkg = Bmkg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bmkg_params
      params.require(:bmkg).permit(:tanggal, :suhu_min, :suhu_max, :suhu_rata, :kelembaban_rata, :curah_hujan, :lama_penyinaran)
    end
end
