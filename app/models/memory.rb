require 'facter'

class Memory

  attr_accessor :id

  def initialize()

    mem_free = Facter.value(:memoryfree_mb)
    id_val = :id.to_s.to_f.to_int
    if id_val < mem_free
      arr_size = id_val
    else
      arr_size = mem_free
    end

    arr = Array.new(size=arr_size)

    for i in 0..arr_size do
      arr[i][1000000] = 1# 1MB array to saturate all memory
    end
    
  end

end
