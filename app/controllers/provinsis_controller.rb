class ProvinsisController < ApplicationController
  before_action :set_provinsi, only: [:show, :edit, :update, :destroy]
  
  def import 
    Provinsi.import(params[:file])
    redirect_to provinsis_path, notice: "Provinsi imported."
  end

  # GET /provinsis
  # GET /provinsis.json
  def index
    @provinsis = Provinsi.all
  end

  # GET /provinsis/1
  # GET /provinsis/1.json
  def show
  end

  # GET /provinsis/new
  def new
    @provinsi = Provinsi.new
  end

  # GET /provinsis/1/edit
  def edit
  end

  # POST /provinsis
  # POST /provinsis.json
  def create
    @provinsi = Provinsi.new(provinsi_params)

    respond_to do |format|
      if @provinsi.save
        format.html { redirect_to @provinsi, notice: 'Provinsi was successfully created.' }
        format.json { render :show, status: :created, location: @provinsi }
      else
        format.html { render :new }
        format.json { render json: @provinsi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provinsis/1
  # PATCH/PUT /provinsis/1.json
  def update
    respond_to do |format|
      if @provinsi.update(provinsi_params)
        format.html { redirect_to @provinsi, notice: 'Provinsi was successfully updated.' }
        format.json { render :show, status: :ok, location: @provinsi }
      else
        format.html { render :edit }
        format.json { render json: @provinsi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provinsis/1
  # DELETE /provinsis/1.json
  def destroy
    @provinsi.destroy
    respond_to do |format|
      format.html { redirect_to provinsis_url, notice: 'Provinsi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provinsi
      @provinsi = Provinsi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provinsi_params
      params.require(:provinsi).permit(:nama)
    end
end
