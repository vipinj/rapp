class ComputeController < ApplicationController
  def compute
    @compute = Compute.new(params)
    render :nothing => true
  end
end
