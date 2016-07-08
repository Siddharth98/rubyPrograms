class Substring
     def getInput
     puts "How many Strings you want to enter "
     size = gets.to_i
     manly = []
     puts "Enter the Strings "
     while size > 0
         manly.push(gets.chomp)
	 size -= 1
     end
     puts "Enter the substring you want to search "
     substring = gets.chomp
     man = [] 
     manly.each do |i|
         if i.include? substring
         man.push(i);
         end
     end
     puts "#{man}"
     end
end
sub = Substring.new
sub.getInput
     
