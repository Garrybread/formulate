class ResponsesController < ApplicationController
    before_action :set_response, only: [:show, :destroy]
    before_action :set_form
    before_action :validate_user_permission, except: [:create, :new]

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
        @q = @form.responses.ransack(params[:q])
        @responses = @q.result
    end

    def destroy
        @response.destroy
        redirect_to form_responses_url(@form), notice: "Response was successfully deleted."
    end

    private

    def validate_user_permission
        if user_signed_in?
            unless current_user.forms.include?(@form)
                redirect_to form_url(@form)
            end
        else
            redirect_to form_url(@form)
        end
    end

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
