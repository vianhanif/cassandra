class StasiunsController < ApplicationController
  before_action :set_stasiun, only: [:show, :edit, :update, :destroy]


  def import
    Stasiun.import(params[:file])
    redirect_to stasiuns_path, notice: "Stasiun imported."
  end
  # GET /stasiuns
  # GET /stasiuns.json
  def index
    @stasiuns = Stasiun.all
  end

  # GET /stasiuns/1
  # GET /stasiuns/1.json
  def show
  end

  # GET /stasiuns/new
  def new
    @stasiun = Stasiun.new
  end

  # GET /stasiuns/1/edit
  def edit
  end

  # POST /stasiuns
  # POST /stasiuns.json
  def create
    @stasiun = Stasiun.new(stasiun_params)

    respond_to do |format|
      if @stasiun.save
        format.html { redirect_to @stasiun, notice: 'Stasiun was successfully created.' }
        format.json { render :show, status: :created, location: @stasiun }
      else
        format.html { render :new }
        format.json { render json: @stasiun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stasiuns/1
  # PATCH/PUT /stasiuns/1.json
  def update
    respond_to do |format|
      if @stasiun.update(stasiun_params)
        format.html { redirect_to @stasiun, notice: 'Stasiun was successfully updated.' }
        format.json { render :show, status: :ok, location: @stasiun }
      else
        format.html { render :edit }
        format.json { render json: @stasiun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stasiuns/1
  # DELETE /stasiuns/1.json
  def destroy
    @stasiun.destroy
    respond_to do |format|
      format.html { redirect_to stasiuns_url, notice: 'Stasiun was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stasiun
      @stasiun = Stasiun.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stasiun_params
      params.require(:stasiun).permit(:nama, :provinsi_id)
    end
end
