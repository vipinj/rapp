class InputOutputController < ApplicationController
  def io
    @io = inputoutput.new
    render :nothing => true

  end
end
