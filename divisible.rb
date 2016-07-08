class Divisible
       def getInput
       puts "Enter the Range from into which you want to find the no divisible by 3 and 5 "
       low = gets.chomp.to_i 
       high = gets.chomp.to_i #gets.split.map(&:to_i)
       arr = [] 
       i = low
       until i > high
            if i % 15 == 0
            arr.push(i)
            i += 15
            else
            i += 1
            end
       end
       puts "The Numbers which are divisible by 3 and 5 in the range #{low} and #{high} are #{arr} " 
       end
end
div = Divisible.new 
div.getInput
       
