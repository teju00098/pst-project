class MastersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_master, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :prepare_import 

  # GET /masters
  # GET /masters.json
  def index
    @masters = Master.all.paginate(page: params[:page], per_page: 200)
  end

  # GET /masters/1
  # GET /masters/1.json
  def show
  end

  # GET /masters/new
  def new
    @master = Master.new
  end

  # GET /masters/1/edit
  def edit
  end

  def search 
    if params[:search].blank?
      @masters = Master.all.paginate(page: params[:page], per_page: 200)
    else
      @masters = Master.search(params)
    end
  end  

  # POST /masters
  # POST /masters.json
  def create
    @master = Master.new(master_params)

    respond_to do |format|
      if @master.save
        format.html { redirect_to @master, notice: 'Master was successfully created.' }
        format.json { render :show, status: :created, location: @master }
      else
        format.html { render :new }
        format.json { render json: @master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /masters/1
  # PATCH/PUT /masters/1.json
  def update
    respond_to do |format|
      if @master.update(master_params)
        format.html { redirect_to @master, notice: 'Master was successfully updated.' }
        format.json { render :show, status: :ok, location: @master }
      else
        format.html { render :edit }
        format.json { render json: @master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /masters/1
  # DELETE /masters/1.json
  def destroy
    @master.destroy
    respond_to do |format|
      format.html { redirect_to masters_url, notice: 'Master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    if params[:name].present? && params[:unit].present?
      MasterBusiness.create_or_update({
        name: params[:name], 
        unit: params[:unit], 
        user_id: current_user.id, 
        filename: File.basename(params[:file])
      })
    end

    Master.import(params[:file])
    redirect_to masters_path, notice: "Master data added successfully !!"
  end 


  def cleardata
    # ActiveRecord::Base.connection.execute("DELETE FROM masters")
    Master.connection.truncate(Master.table_name)
    redirect_to masters_path
  end 

  def prepare_import
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master
      @master = Master.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_params
      params.require(:master).permit(:CountName, :StoreCode, :StoreName, :VenderCode, :VenderName, :DeptCode, :DeptName, :SubDeptCode, :SubDeptName, :Class, :ClassName, :SubClass, :SubClassName, :SKUType, :SpecialAttribute, :SKU, :BarcodeIBC, :BarcodeSBC, :Barcode1, :Barcode2, :Barcode3, :Barcode4, :Barcode5, :Barcode6, :Barcode7, :Barcode8, :Barcode9, :Barcode10, :ProductName, :Brand, :Model, :UnitOfMeasure, :Stock, :PackSize, :Cost, :RetailPrice, :Status)
    end
end
