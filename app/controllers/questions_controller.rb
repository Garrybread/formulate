class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :edit, :update, :destroy]

    def index
        @questions = Question.all
    end

    def create
        @question = Question.new(question_params)

        if @question.save
            redirect_to form_url(@question), notice: "Question was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def new
        @question = Question.new
    end

    def show
    end

    def edit
    end



    private

    def set_question
        @question = Question.find(params[:id])
    end

    def question_params
        params.require(:quesiton).permit(:prompt)
    end

end
