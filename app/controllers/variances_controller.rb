class VariancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_variance, only: [:show, :edit, :update, :destroy]

  # GET /variances
  # GET /variances.json
  def index
    @variances = Variance.all.paginate(page: params[:page], per_page: 100)
  end

  # GET /variances/1
  # GET /variances/1.json
  def show
  end

  # GET /variances/new
  def new
    @variance = Variance.new
  end

  # GET /variances/1/edit
  def edit
  end

  # POST /variances
  # POST /variances.json
  def create
    @variance = Variance.new(variance_params)

    respond_to do |format|
      if @variance.save
        format.html { redirect_to @variance, notice: 'Variance was successfully created.' }
        format.json { render :show, status: :created, location: @variance }
      else
        format.html { render :new }
        format.json { render json: @variance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variances/1
  # PATCH/PUT /variances/1.json
  def update
    respond_to do |format|
      if @variance.update(variance_params)
        format.html { redirect_to @variance, notice: 'Variance was successfully updated.' }
        format.json { render :show, status: :ok, location: @variance }
      else
        format.html { render :edit }
        format.json { render json: @variance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variances/1
  # DELETE /variances/1.json
  def destroy
    @variance.destroy
    respond_to do |format|
      format.html { redirect_to variances_url, notice: 'Variance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Variance.import(params[:file])
    redirect_to variances_path, notice: "Variance data added successfully !!"
  end 

  def cleardata
    # ActiveRecord::Base.connection.execute("DELETE FROM masters")
    Variance.connection.truncate(Variance.table_name)
    redirect_to variances_path
  end 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variance
      @variance = Variance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def variance_params
      params.require(:variance).permit(:BARCODE, :LOCATION, :QUANTITY)
    end
end
