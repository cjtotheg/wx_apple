class WxesController < ApplicationController
  before_action :set_wx, only: %i[ show edit update destroy ]

  # GET /wxes or /wxes.json
  def index
    @wxes = Wx.all
  end

  # GET /wxes/1 or /wxes/1.json
  def show
    address = "#{@wx.street} #{@wx.city}, #{@wx.state_or_province} #{@wx.postal_code} #{@wx.country}"
    @weather = @wx.get_weather(postal_code: @wx.postal_code, address: address)
  end

  # GET /wxes/new
  def new
    @wx = Wx.new
  end

  # GET /wxes/1/edit
  def edit
  end

  # POST /wxes or /wxes.json
  def create
    @wx = Wx.new(wx_params)
    
    address = "#{wx_params[:street]} #{wx_params[:city]}, #{wx_params[:state_or_province]} #{wx_params[:postal_code]} #{wx_params[:country]}"

    #this will set and fetch weather from cache
    @wx.get_weather(postal_code: wx_params[:postal_code], address: address)

    respond_to do |format|
      if @wx.save
        format.html { redirect_to wx_url(@wx), notice: "Wx was successfully created." }
        format.json { render :show, status: :created, location: @wx }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wx.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wxes/1 or /wxes/1.json
  def update
    respond_to do |format|
      if @wx.update(wx_params)
        format.html { redirect_to wx_url(@wx), notice: "Wx was successfully updated." }
        format.json { render :show, status: :ok, location: @wx }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wx.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wxes/1 or /wxes/1.json
  def destroy
    @wx.destroy

    respond_to do |format|
      format.html { redirect_to wxes_url, notice: "Wx was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wx
      @wx = Wx.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wx_params
      params.require(:wx).permit(:street, :city, :state_or_province, :postal_code, :country)
    end
end
