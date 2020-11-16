class RatesController < ApplicationController
  before_action :set_experience
  before_action :set_rate, only: [:show, :edit, :update, :destroy]

  # GET experiences/1/rates
  def index
    @rates = @experience.rates
  end

  # GET experiences/1/rates/1
  def show
  end

  # GET experiences/1/rates/new
  def new
    @rate = @experience.rates.build
  end

  # GET experiences/1/rates/1/edit
  def edit
  end

  # POST experiences/1/rates
  def create
    @rate = @experience.rates.build(rate_params)

    if @rate.save
      redirect_to([@rate.experience, @rate], notice: 'Rate was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT experiences/1/rates/1
  def update
    if @rate.update_attributes(rate_params)
      redirect_to([@rate.experience, @rate], notice: 'Rate was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE experiences/1/rates/1
  def destroy
    @rate.destroy

    redirect_to experience_rates_url(@experience)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:experience_id])
    end

    def set_rate
      @rate = @experience.rates.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rate_params
      params.require(:rate).permit(:rate, :ip, :experience_id)
    end
end
