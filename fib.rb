class Fibonocci
   def fib
       arr = []
       puts "Enter the No of terms you want to generate the Fibinocci series"
       n = gets.to_i
       a,b = 0,1
       arr.push(a)
       arr.push(b)
       (2..n-1).each do |i|
            arr[i] = arr[i-2] + arr[i-1]
       end
       puts "#{arr}"
   end
end
fib = Fibonocci.new
fib.fib
