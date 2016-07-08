class Gcd
    def gcd( first , second )
    if(second == 0)
    return first
    else
    gcd(second , first % second )
    end
    end
    def lcm( first , second )
    return first * second / gcd( first , second )
    end
end
gcd = Gcd.new
lcm = Gcd.new
puts "Please enter the two no "
first = gets.to_i
second = gets.to_i
puts "The Greatest common Divisor is #{gcd.gcd(first , second )} "
puts "The Lowest common Multiple is #{gcd.lcm(first , second )} "
