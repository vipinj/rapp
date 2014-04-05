require 'matrix'

class Compute

  attr_accessor :id
  
#  validates :id => true
  
  def initialize()
    m1 = Matrix.identity(100)
    m2 = Matrix.identity(100)
    m3 = m1 * m2
  end

end
