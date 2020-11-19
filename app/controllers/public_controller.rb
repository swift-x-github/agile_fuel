class PublicController < ApplicationController
  before_action :set_experience, only: [:show]
  def main
    @experiences = Experience.all
  end
  
  

private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id]) 
    end

    # Only allow a list of trusted parameters through.
    def experience_params
      params.require(:experience).permit(:name)
    end

end