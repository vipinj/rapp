class ComputeController < ApplicationController
  def compute
    @compute = Compute.new
    render :nothing => true
  end
end
