class CongressmenController < ApplicationController
  before_action :set_congressman, only: [:show, :edit, :update, :destroy]

  # GET /congressmen
  # GET /congressmen.json
  def index
    @congressmen = Congressman.all
    respond_to do |format|
      format.html
      format.csv {send_data @congressmen.to_csv}
      format.xls #{send_data @congressmen.to_csv(col_sep: "\t")}
    end
  end

    def import
      Congressman.import(params[:file])
      redirect_to root_url, notice: "congressmen imported."
    end



  # GET /congressmen/1
  # GET /congressmen/1.json
  def show
  end

  # GET /congressmen/new
  def new
    @congressman = Congressman.new
  end

  # GET /congressmen/1/edit
  def edit
  end

  # POST /congressmen
  # POST /congressmen.json
  def create
    @congressman = Congressman.new(congressman_params)

    respond_to do |format|
      if @congressman.save
        format.html { redirect_to @congressman, notice: 'Congressman was successfully created.' }
        format.json { render :show, status: :created, location: @congressman }
      else
        format.html { render :new }
        format.json { render json: @congressman.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /congressmen/1
  # PATCH/PUT /congressmen/1.json
  def update
    respond_to do |format|
      if @congressman.update(congressman_params)
        format.html { redirect_to @congressman, notice: 'Congressman was successfully updated.' }
        format.json { render :show, status: :ok, location: @congressman }
      else
        format.html { render :edit }
        format.json { render json: @congressman.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /congressmen/1
  # DELETE /congressmen/1.json
  def destroy
    @congressman.destroy
    respond_to do |format|
      format.html { redirect_to congressmen_url, notice: 'Congressman was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_congressman
      @congressman = Congressman.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def congressman_params
      params.require(:congressman).permit(:name, :ej, :area, :lecture)
    end
end
