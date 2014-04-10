class InputOutputController < ApplicationController
  def input_output
    @input_output = Inputoutput.new(params)
    render :nothing => true
  end
end








