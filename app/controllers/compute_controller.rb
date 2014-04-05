class ComputeController < ApplicationController
  def compute
    @compute = Compute
    render :nothing => true
  end
end
