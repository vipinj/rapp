require 'facter'

class InputOutput

  attr_accessor :id

  def initialize()
    val = :id.to_s.to_int
    if val > 500
      val = 500
    end
    
    for i in 0..val do
      name = "/tmp/" + i.to_s
      temp = File.new(name, "w")
      temp.truncate(1000000) # create 1M files
      f[i] = name
    end
    
    for i in 0..f.size do
      File.delete(f[i])
   end
    
  end
  
end
