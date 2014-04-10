require 'facter'

class Inputoutput

  attr_accessor :id

  def initialize(params)
    @val = params[:id].to_s.to_i

    if @val > 500
      @val = 500
    end
    
    farr = Array.new

    for i in 0..@val do
      name = "/tmp/" + i.to_s
      temp = File.new(name, "w")
      temp.truncate(1000000) # create 1M files
      farr[i] = name
    end
    
    for i in 0..farr.size do
      File.delete(farr[i])
    end
  end

end
