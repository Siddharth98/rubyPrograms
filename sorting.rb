class Sorting  
     def getInput
        puts "Enter the no of elements you want to enter "
        @n = gets.to_i 
        @arr = []
        puts "Enter #{@n} elements "
        i=1
        #puts a
        until i > @n do
        @arr.push(gets.to_i)
        i+=1
        end
     end
     def sort
       for i in 0..@n-2
          for j in i..@n-1
          if @arr[i]<@arr[j]
          @arr[j]=@arr[i]+@arr[j]
          @arr[i]=@arr[j]-@arr[i]
          @arr[j]=@arr[j]-@arr[i]
          end
          end
       end
     end
     def arr
     @arr
     end
end
sort = Sorting.new
sort.getInput
sort.sort
puts "#{sort.arr}"
