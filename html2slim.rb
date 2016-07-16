class Slimconverter 
  def initialize
    @count = "  "
    @j = 0
    @i = 0
  end
  def slim 
    puts "Enter the file name "
    name = gets.chomp
    text = File.open(name , "r")
    file = File.new("slimcon.rb","w")
    text.each_line do |line|
      line = line.strip
      line = line + "\n"
      if line.include? ('<!--')
        line = comment(line)
      elsif line.include?('<meta')
        line = for_metatag(line)      
      elsif line.include? ('<!') 
        line = for_doctype(line)
      else
        line = for_splitting(line)
      end
      file.write(line)
    end
  end
  def comment(str)
    str.sub!(/\<\!\-\-/,@count*@i+'/! ').sub!(/\-\-\>/,'') 
  end
  def for_metatag(str)
    str.sub!(/\</,@count*@i).sub!(/\>/,'')
  end
  def for_doctype(str)
  	str.sub!(/\<\!/,'').sub!(/\>/,'')
  end
  def for_cons(str)
    if str.strip.length > 0
      @j += 1
        if @j > 1 
          str = @count*@i + "| " + str
        else
          str = "\n" + @count*@i + "| "+ str
        end 
    end
    str
  end
  def for_splitting(line)
    spa = ""
      arr = line.split('>')
      arr.each do |val|
        if val.index(' ') == 0
          val.sub!(/\s+/,'')
        end
        if val.index('<') && val.index('<')!=0
          @j += 1
          spa = spa + @count*@i + "| " + val[0..(val.index('<')-1)] + "\n"
          val = val[val.index('<')..(val.length-1)]
        end
        if val.include?('</')
          @i -= 1
          @j = 0
          next
        elsif val.include?('<')
          val = for_starttag(val)
        else
          val = for_cons(val)
        end
        val.gsub!(/^$\n/,"")
        spa = spa + val
      end
    spa
  end
  def for_starttag(str)
    if str.include?(' id="')
      cl = str[(str.index(' id="')+5)..(str.index('"',str.index(' id="')+5)-1)]
      cl.gsub!(/\s/,"#")
      str.insert(str.index(' ',str.index('<')+1),'#'+cl)
      str = str[0..(str.index(' id="')-1)] + str[(str.index('"',str.index(' id="')+5)+1)..(str.length-1)]
    end
  	if str.include?(' class="')
      cl = str[(str.index(' class="')+8)..(str.index('"',str.index(' class="')+8)-1)]
      cl.gsub!(/\s/,".")
      str.insert(str.index(' ',str.index('<')+1),'.'+cl)
      str = str[0..(str.index(' class="')-1)] + str[(str.index('"',str.index(' class="')+8)+1)..(str.length-1)]
    end
    if str.include?('placeholder="')
      str.insert(str.index('placeholder="')+12,'(')
      str.insert(str.index('"',str.index('placeholder=(')+14)+1,')')
    end
    str.sub!(/</,'')
    str.sub!(/div/,'') 
    if !str.start_with?("img") && !str.start_with?("input") && !str.start_with?("link")
      str = @count*@i + str 
      @i += 1 
    else
      if str[str.length-1] != '/'
        str= str+"/" 
      end
      str = @count*@i + str 
    end
    str = str + "\n"
    str
  end
end
obj = Slimconverter.new
obj.slim