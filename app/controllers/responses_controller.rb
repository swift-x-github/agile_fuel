class ResponsesController < ApplicationController
  before_action :set_experience
  before_action :set_response, only: [:show, :edit, :update, :destroy]
 
 

  # GET experiences/1/responses
  def index
    @responses = @experience.responses
  end

  # GET experiences/1/responses/1
  def show
  end

  # GET experiences/1/responses/new
  def new
    @response = @experience.responses.build
  end

  # GET experiences/1/responses/1/edit
  def edit
  end

  # POST experiences/1/responses
  def create
    
    @response = @experience.responses.build(response_params)
   
    if @response.save
      redirect_to([@response.experience, @response], notice: 'Response was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT experiences/1/responses/1
  def update
    #@response.experience.rate =  @response.experience.total_raiting
    @experience.rate = @experience.total_raiting
    if @response.update_attributes(response_params)
      redirect_to([@response.experience, @response], notice: 'Response was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE experiences/1/responses/1
  def destroy
    
    @response.destroy

    redirect_to experience_responses_url(@experience)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:experience_id])
      
    end

    def set_response
      @response = @experience.responses.find(params[:id])

    end

    # Only allow a trusted parameter "white list" through.
    def response_params
      params.require(:response).permit(:name, :raiting, :ip, :experience_id)
    end
end
