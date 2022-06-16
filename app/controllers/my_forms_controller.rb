class MyFormsController < ApplicationController
  def index
    @forms = Form.all
  end
end
