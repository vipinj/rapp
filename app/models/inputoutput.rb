#require 'facter'

class Inputoutput

  attr_accessor :id

  def initialize(params)
    @val = params[:id].to_s.to_i

    if @val > 500 # hard coded for now, facter doesn't expose free disk space
      @val = 500
    end
    
    farr = Array.new

    Dir.mkdir(Rails.root.join('tmp')) unless Dir.exist?(Rails.root.join('tmp'))
    
    for i in 0..@val do
      t_name = "tmp/" + i.to_s
      name = Rails.root.join(t_name)
      temp = File.new(name.to_s, "w+")
      temp.truncate(10000000) # create 1M files
      temp.close
      farr[i] = name
    end
    
    for j in 0..@val do
      t_name = "tmp/" + j.to_s
      namep = Rails.root.join(t_name)
      tmp = farr[i]
      File.delete(namep)
    end
  end

end
