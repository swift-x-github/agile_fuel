class QuestionsController < ApplicationController
  before_action :set_experience
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET experiences/1/questions
  def index
    @questions = @experience.questions
  end

  # GET experiences/1/questions/1
  def show
  end

  # GET experiences/1/questions/new
  def new
    @question = @experience.questions.build
  end

  # GET experiences/1/questions/1/edit
  def edit
  end

  # POST experiences/1/questions
  def create
    @question = @experience.questions.build(question_params)

    if @question.save
      redirect_to([@question.experience, @question], notice: 'Question was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT experiences/1/questions/1
  def update
    if @question.update_attributes(question_params)
      redirect_to([@question.experience, @question], notice: 'Question was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE experiences/1/questions/1
  def destroy
    @question.destroy

    redirect_to experience_questions_url(@experience)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.where(user_id: current_user.id).find(params[:experience_id])
    end

    def set_question
      @question = @experience.questions.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:question, :experience_id)
    end
end
