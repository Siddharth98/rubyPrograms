class Greatest
     def greatest
         h = {"a" => "10" , "b" => "12" , "c" => "5", "d" => "98" , "e" =>"21" }
         max = 0
         key = ""
         h.each do |i , value| 
             if( max < value.to_i )
                max = value.to_i
                key = i
             end
         end
         puts "The Key Having Highest Value is #{key}"
     end
end
great = Greatest.new
great.greatest
