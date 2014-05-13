class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end
   # formats the time into a string
  def time_string
    time = convert_time(self.seconds)
    hours = format_time(time[:hours])
    minutes = format_time(time[:minutes])
    new_seconds = format_time(time[:seconds])
    "#{hours}:#{minutes}:#{new_seconds}"
  end

  ##convert seconds to a useable hash
  def convert_time(seconds)
    time = {:hours => 0,:minutes => 0,:seconds => 0}
    (0...seconds).each do |s|
     time[:seconds] += 1
       if time[:seconds] == 60
         time[:minutes] += 1
         time[:seconds] = 0
       end   
       if time[:minutes] == 60
           time[:hours] += 1
           time[:minutes] = 0
       end
     end 
    time
  end
  #formats time to display as needed
  def format_time(num)
    return "0#{num}" if num < 10
    return "00" if num == 0
    num.to_s
  end

end