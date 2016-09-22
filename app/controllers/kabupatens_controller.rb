class KabupatensController < ApplicationController
  before_action :set_kabupaten, only: [:show, :edit, :update, :destroy]

  # GET /kabupatens
  # GET /kabupatens.json
  def index
    @kabupatens = Kabupaten.all
  end

  # GET /kabupatens/1
  # GET /kabupatens/1.json
  def show
  end

  # GET /kabupatens/new
  def new
    @kabupaten = Kabupaten.new
  end

  # GET /kabupatens/1/edit
  def edit
  end

  # POST /kabupatens
  # POST /kabupatens.json
  def create
    @kabupaten = Kabupaten.new(kabupaten_params)

    respond_to do |format|
      if @kabupaten.save
        format.html { redirect_to @kabupaten, notice: 'Kabupaten was successfully created.' }
        format.json { render :show, status: :created, location: @kabupaten }
      else
        format.html { render :new }
        format.json { render json: @kabupaten.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kabupatens/1
  # PATCH/PUT /kabupatens/1.json
  def update
    respond_to do |format|
      if @kabupaten.update(kabupaten_params)
        format.html { redirect_to @kabupaten, notice: 'Kabupaten was successfully updated.' }
        format.json { render :show, status: :ok, location: @kabupaten }
      else
        format.html { render :edit }
        format.json { render json: @kabupaten.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kabupatens/1
  # DELETE /kabupatens/1.json
  def destroy
    @kabupaten.destroy
    respond_to do |format|
      format.html { redirect_to kabupatens_url, notice: 'Kabupaten was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kabupaten
      @kabupaten = Kabupaten.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kabupaten_params
      params.require(:kabupaten).permit(:nama, :provinsi_id)
    end
end
