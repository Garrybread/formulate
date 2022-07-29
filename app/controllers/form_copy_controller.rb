class FormCopyController < ApplicationController
    before_action :set_form
    def create
       @new_form = @form.amoeba_dup
       if @new_form.save
            @new_form.reload
            redirect_to form_path(@new_form), notice: "Form was successfully copied."
       else
            redirect_to form_path(@form), alert: "Failed to copy form."
       end
    end

    private

    def set_form
        @form = Form.find(params[:form_id])
    end
end