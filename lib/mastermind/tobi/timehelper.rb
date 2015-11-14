module MasterMind
  module Tobi
    module TimeHelper
      def time_convert(time_int)
        hours = time_int / 3600
        minutes = (time_int % 3600) / 60
        seconds = (time_int % 3600) % 60
        time_string = construct_string(hours, minutes, seconds)
      end
      
      def construct_string(hours, minutes, seconds)
        time_string = '' 
        if hours >= 1
          time_string << (hours.to_s + (hours == 1 ? ' hour' :' hours'))
          time_string << ', ' if minutes > 0
        end    
         
        if minutes >= 1
          time_string << (minutes.to_s + (minutes == 1 ? ' minute' : ' minutes'))
          time_string << ', ' if seconds > 0
        end
         
        if seconds >= 1
          time_string << (seconds.to_s + (seconds == 1 ? ' second' : ' seconds'))
        elsif seconds == 0 && time_string == ''
          time_string << '0 seconds'
        end
        
        time_string
      end
    end
  end
end