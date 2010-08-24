# timerator
timerator is a time computing library written that allows you to work with date ranges in smaller chunks

## example
    Timerator.new(Time.gm(2000,"jan",1), Time.gm(2000,"jan",10)).each(:day) do |beginning,ending|
      puts "#{beginning} - #{ending}"
    end

    =>

    Sat Jan 01 00:00:00 UTC 2000..Sun Jan 02 00:00:00 UTC 2000  
    Sun Jan 02 00:00:00 UTC 2000..Mon Jan 03 00:00:00 UTC 2000  
    Mon Jan 03 00:00:00 UTC 2000..Tue Jan 04 00:00:00 UTC 2000  
    Tue Jan 04 00:00:00 UTC 2000..Wed Jan 05 00:00:00 UTC 2000  
    Wed Jan 05 00:00:00 UTC 2000..Thu Jan 06 00:00:00 UTC 2000  
    Thu Jan 06 00:00:00 UTC 2000..Fri Jan 07 00:00:00 UTC 2000  
    Fri Jan 07 00:00:00 UTC 2000..Sat Jan 08 00:00:00 UTC 2000  
    Sat Jan 08 00:00:00 UTC 2000..Sun Jan 09 00:00:00 UTC 2000  
    Sun Jan 09 00:00:00 UTC 2000..Mon Jan 10 00:00:00 UTC 2000  

### notes
  supports seconds, minutes, hours, days, and weeks
