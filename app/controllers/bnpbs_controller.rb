class BnpbsController < ApplicationController
  before_action :set_bnpb, only: [:show, :edit, :update, :destroy]

  def import
    Bnpb.import(params[:file])
    redirect_to bnpbs_path, notice: "BNPB imported."
  end
  # GET /bnpbs
  # GET /bnpbs.json
  def index
    @bnpbs = Bnpb.all
  end

  # GET /bnpbs/1
  # GET /bnpbs/1.json
  def show
  end

  # GET /bnpbs/new
  def new
    @bnpb = Bnpb.new
  end

  # GET /bnpbs/1/edit
  def edit
  end

  # POST /bnpbs
  # POST /bnpbs.json
  def create
    @bnpb = Bnpb.new(bnpb_params)

    respond_to do |format|
      if @bnpb.save
        format.html { redirect_to @bnpb, notice: 'Bnpb was successfully created.' }
        format.json { render :show, status: :created, location: @bnpb }
      else
        format.html { render :new }
        format.json { render json: @bnpb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bnpbs/1
  # PATCH/PUT /bnpbs/1.json
  def update
    respond_to do |format|
      if @bnpb.update(bnpb_params)
        format.html { redirect_to @bnpb, notice: 'Bnpb was successfully updated.' }
        format.json { render :show, status: :ok, location: @bnpb }
      else
        format.html { render :edit }
        format.json { render json: @bnpb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bnpbs/1
  # DELETE /bnpbs/1.json
  def destroy
    @bnpb.destroy
    respond_to do |format|
      format.html { redirect_to bnpbs_url, notice: 'Bnpb was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bnpb
      @bnpb = Bnpb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bnpb_params
      params.require(:bnpb).permit(:tanggal, :bencana_id, :kabupaten_id, :korban_meninggal, :korban_hilang, :korban_luka, :korban_mengungsi)
    end
end
