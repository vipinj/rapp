require 'matrix'
#require 'facter'

class Compute

  attr_accessor :id # id in the form axb where a x b is the Matrix size
  
  def initialize(params)
    id = params[:id]
    
    arr = id.to_s.split('x')
    #puts "SizeError" unless arr.size == 2

    if arr[0].to_i > 100 
        arr[0] = 100
    end
    if arr[1].to_i > 100
      arr[1] = 100
    end

    #proc = Facter.value(:processorcount)
    #puts arr[0].to_i
    m1 = Matrix.identity(arr[0].to_i) 
    m2 = Matrix.identity(arr[1].to_i)
    m3 = m1 * m2
  end
  
end
