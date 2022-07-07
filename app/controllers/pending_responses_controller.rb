class PendingResponsesController < ApplicationController
    before_action :set_form
    def index
        @responses = Response.all
        @forms = Form.all
    end

    private

    def set_form
        @form = Form.find(params[:form_id])
    end

end
