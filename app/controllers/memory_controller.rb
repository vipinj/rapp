class MemoryController < ApplicationController
  def memory
    @memory = Memory.new(params)
    render :nothing => true
  end
end
