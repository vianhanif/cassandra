class PoldsController < ApplicationController
  before_action :set_pold, only: [:show, :edit, :update, :destroy]

  # GET /polds
  # GET /polds.json
  def index
    @polds = Pold.all
  end

  # GET /polds/1
  # GET /polds/1.json
  def show
  end

  # GET /polds/new
  def new
    @pold = Pold.new
  end

  # GET /polds/1/edit
  def edit
  end

  # POST /polds
  # POST /polds.json
  def create
    @pold = Pold.new(pold_params)

    respond_to do |format|
      if @pold.save
        format.html { redirect_to @pold, notice: 'Pold was successfully created.' }
        format.json { render :show, status: :created, location: @pold }
      else
        format.html { render :new }
        format.json { render json: @pold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polds/1
  # PATCH/PUT /polds/1.json
  def update
    respond_to do |format|
      if @pold.update(pold_params)
        format.html { redirect_to @pold, notice: 'Pold was successfully updated.' }
        format.json { render :show, status: :ok, location: @pold }
      else
        format.html { render :edit }
        format.json { render json: @pold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polds/1
  # DELETE /polds/1.json
  def destroy
    @pold.destroy
    respond_to do |format|
      format.html { redirect_to polds_url, notice: 'Pold was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pold
      @pold = Pold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pold_params
      params.require(:pold).permit(:h1, :h2, :h3, :h4, :h5, :h6, :h7, :pola, :keterangan)
    end
end
