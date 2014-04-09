require 'matrix'
require 'facter'

class ComputeCPU

  attr_accessor :id # id in the form axb where a x b is the Matrix size
  
  def initialize()

    arr = :id.to_s.split('x')

    raise "SizeError" unless arr.size == 2

    if arr[0].to_int > 100 
        arr[0] = 100
    end
    if arr[1].to_int > 100
      arr[1] = 100
    end

    proc = Facter.value(:processorcount)
    
    m1 = Matrix.identity(arr[0].to_int)
    m2 = Matrix.identity(arr[1].to_int)
    m3 = m1 * m2
  end
  
end
