class ResponsesController < ApplicationController
    before_action :set_response, only: [:show]
    before_action :set_form

    def create
        @response = @form.responses.new(response_params)

        if @response.save
            redirect_to form_url(@form), notice: "Response was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def new
        @response = @form.responses.new
    end

    def show
    end

    def index
        @responses = Response.all
    end

    def destroy
        @response.destroy
        redirect_to form_responses_url(@form), notice: "Response was successfully deleted."
    end

    private

    def set_response
        @response = Response.find(params[:id])
    end

    def set_form
        @form = Form.find(params[:form_id])
    end

    def response_params
        params.require(:response).permit(:form_id, question_responses_attributes: [:answer, :question_id])
    end

end
