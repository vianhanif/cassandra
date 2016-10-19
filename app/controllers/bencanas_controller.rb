class BencanasController < ApplicationController
  before_action :set_bencana, only: [:show, :edit, :update, :destroy]

  def import
    Bencana.import(params[:file])
    redirect_to bencanas_path, notice: "Bencana imported."
  end
  # GET /bencanas
  # GET /bencanas.json
  def index
    @bencanas = Bencana.all.paginate(page: params[:page], per_page: 30)
  end

  # GET /bencanas/1
  # GET /bencanas/1.json
  def show
  end

  # GET /bencanas/new
  def new
    @bencana = Bencana.new
  end

  # GET /bencanas/1/edit
  def edit
  end

  # POST /bencanas
  # POST /bencanas.json
  def create
    @bencana = Bencana.new(bencana_params)

    respond_to do |format|
      if @bencana.save
        format.html { redirect_to @bencana, notice: 'Bencana was successfully created.' }
        format.json { render :show, status: :created, location: @bencana }
      else
        format.html { render :new }
        format.json { render json: @bencana.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bencanas/1
  # PATCH/PUT /bencanas/1.json
  def update
    respond_to do |format|
      if @bencana.update(bencana_params)
        format.html { redirect_to @bencana, notice: 'Bencana was successfully updated.' }
        format.json { render :show, status: :ok, location: @bencana }
      else
        format.html { render :edit }
        format.json { render json: @bencana.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bencanas/1
  # DELETE /bencanas/1.json
  def destroy
    @bencana.destroy
    respond_to do |format|
      format.html { redirect_to bencanas_url, notice: 'Bencana was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bencana
      @bencana = Bencana.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bencana_params
      params.require(:bencana).permit(:nama)
    end
end
