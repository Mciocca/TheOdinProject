class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end
 
  def time_string
    format(self.seconds)
  end

  def format(seconds)
    time = convert_time(seconds)
    hours = format_time(time[:hours])
    minutes = format_time(time[:minutes])
    new_seconds = format_time(time[:seconds])
    return hours+":"+minutes+":"+new_seconds
  end

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

  def format_time(num)
    if num < 10
      return "0#{num}"
    elsif num == 0
      return "00"
    else
      return num.to_s
    end
  end

end