class Sum
     def sum
       h = {"a" => "10" , "b" => "12" , "c" => "5"}
       sum = 0
       h.each do |key,value|
       sum = sum + value.to_i
       end
       puts "The sum is #{sum}"
     end
end
sum = Sum.new
puts sum.sum
