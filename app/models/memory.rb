require 'facter'

class Memory

  attr_accessor :id

  def initialize(params)
    @id = params[:id]

    mem_free = Facter.value(:memoryfree_mb).to_i
    id_val = @id.to_s.to_f.to_int
    puts id_val, mem_free
    if id_val < mem_free
      arr_size = id_val
    else
      arr_size = mem_free
    end

    arr = Array.new(size=arr_size)

    for i in 0..arr_size do
      arr[i] = Array.new(size = 1000000)# array to saturate all memory
    end
    
  end

end
