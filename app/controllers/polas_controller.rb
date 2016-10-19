class PolasController < ApplicationController
  before_action :set_pola, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, only:[:import, :new, :create, :edit, :update, :destroy, :report]

  def import
    Pola.import(params[:file])
    redirect_to polas_path, notice: "Pola imported."
  end

  # GET /polas
  # GET /polas.json
  def index
    @polas = Pola.all.paginate(page: params[:page], per_page: 30)
  end

  # GET /polas/1
  # GET /polas/1.json
  def show
  end

  # GET /polas/new
  def new
    @pola = Pola.new
  end

  # GET /polas/1/edit
  def edit
  end

  # POST /polas
  # POST /polas.json
  def create
    @pola = Pola.new(pola_params)

    respond_to do |format|
      if @pola.save
        format.html { redirect_to @pola, notice: 'Pola was successfully created.' }
        format.json { render :show, status: :created, location: @pola }
      else
        format.html { render :new }
        format.json { render json: @pola.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polas/1
  # PATCH/PUT /polas/1.json
  def update
    respond_to do |format|
      if @pola.update(pola_params)
        format.html { redirect_to @pola, notice: 'Pola was successfully updated.' }
        format.json { render :show, status: :ok, location: @pola }
      else
        format.html { render :edit }
        format.json { render json: @pola.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polas/1
  # DELETE /polas/1.json
  def destroy
    @pola.destroy
    respond_to do |format|
      format.html { redirect_to polas_url, notice: 'Pola was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pola
      @pola = Pola.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pola_params
      params.require(:pola).permit(:bnpb_id, :h1, :h2, :h3, :h4, :h5, :h6, :h7, :polanya, :keterangan)
    end
end
