class FormsController < ApplicationController
    before_action :set_form, only: [:show, :edit, :update, :destroy]

    def index
        @forms = Form.all
    end

    def create
        @form = Form.new(form_params)

        if @form.save
            redirect_to form_url(@form), notice: "Form was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def new
        @form = Form.new
    end

    def show
    end

    def edit
    end

    def update
        if @form.update(form_params)
            redirect_to form_url(@form), notice: "Form was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @form.destroy
        redirect_to forms_url, notice: "Form was successfully deleted."
    end

    private

    def set_form
        @form = Form.find(params[:id])
    end

    def form_params
        params.require(:form).permit(:name, :description)
    end

end
