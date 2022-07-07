class ResponseStateController < ApplicationController
  before_action :set_form
  before_action :set_response
  def create
    if params[:aasm_state] == "approve"
      @response.approve!
    elsif params[:aasm_state] == "decline"
      @response.decline!
    elsif params[:aasm_state] == "repend"
      @response.repend!
    end
    redirect_to form_response_path(@form, @response), notice: "Approved response."
  end
  private
  def set_form
    @form = Form.find(params[:form_id])
  end
  def set_response
    @response = Response.find(params[:response_id])
  end
end
