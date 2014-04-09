class MemoryController < ApplicationController
  def memory
    @memory = Memory.new
    render :nothing => true
  end
end
