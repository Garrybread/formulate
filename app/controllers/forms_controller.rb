class FormsController < ApplicationController
    before_action :set_form, only: [:show, :edit, :update, :destroy]

    def index
        @forms = Form.all

        if params[:search_by_name] && params[:search_by_name] != ""
            @forms = @forms.where("lower(name) like lower(:q) or lower(description) like lower(:q)", q: "%#{params[:search_by_name]}%")
          end
    end

    def create
        @form = current_user.forms.new(form_params)
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
        redirect_to my_forms_index_url, notice: "Form was successfully deleted."
    end

    def add_user
        @form.users << current_user
    end

    private

    def set_form
        @form = Form.find(params[:id])
    end

    def form_params
        params.require(:form).permit(:name, :description, questions_attributes: [:id, :_destroy, :prompt])
    end

end
