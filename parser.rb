class Node
  attr_accessor :key, :value
  def initialize(k,v)
    @key = k
    @value = v
  end
  def setval(v)
    @value += v
  end
end

class Parser
  attr_accessor :h, :filename
  def initialize(f)
    @hash = Array.new
    @filename = f
  end
  def parse
    f = File.new(@filename)
    f.each do |l|
      ls = l.split(" ")
      ls.each do |t|
        if t == ls.fetch(0)
          if t[-1,1] == ':'
            n = Node.new(t,ls.slice(1,ls.length))
            else
            n = @hash.pop
            n.setval(ls.slice(0,ls.length))
          end
          @hash.push(n)
        end
      end
    end
  end
  def print(flag)
    case flag
      when "-a"
      @hash.each {|i| puts i.key + "\n" + i.value.join(" ") + "\n\n"}
      when "-f"
      received = -1
      @hash.each do |i|
        if i.key == "Received:"
          if received == 0
            puts "\n" + i.value.join(" ") + "\n\n"
            received = 1
            break
          end
          received += 1
        end
      end
      when "-b"
      e = @hash.select {|i| i.key == "Content-Transfer-Encoding:"}
      puts "\n" + e[0].value.join(" ") + "\n\n"
      when "-s"
      e = @hash.select {|i| i.key == "Subject:"}
      puts "\n" + e[0].value.join(" ") + "\n\n"
      when "-d"
      e = @hash.select {|i| i.key == "Date:"}
      puts "\n" + e[0].value.join(" ") + "\n\n"
      when "-t"
      e = @hash.select {|i| i.key == "Delivered-To:"}
      puts "\n" + e[0].value.join(" ") + "\n\n"
    end
  end
end

def main
  p = Parser.new(ARGV[0])
  p.parse
  if ARGV.length > 1
    p.print ARGV[1]
  end
end

if __FILE__ == $0
  main
end
