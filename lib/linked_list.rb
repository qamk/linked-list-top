# frozen-string-literal: true

require_relative 'node.rb'
require_relative 'commands.rb'

# Representing the linked list struct
class LinkedList
  include Commands
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
    welcome
    play
  end

  def play
    loop do
      puts
      print 'Enter a command or q to quit: '
      action = gets.chomp.downcase
      break if action == 'q'

      next unless use.include?(action)

      method = use[action]
      call_method(method)
    end
  end

  def append(value)
    return prepend(value) if head.nil?

    current = tail
    @tail = Node.new(value)
    current.next = tail
    puts "\e[38;5;2mPushed\e[0m #{value}"
  end

  def prepend(value)
    if head.nil?
      @head = Node.new(value)
      @tail = head
      puts "Since this is the first value we have \e[38;5;3mShifted\e[0m #{value}"
      return
    end
    current = head
    @head = Node.new(value, current)
    puts "\e[38;5;3mShifted\e[0m #{value}"
  end

  def size
    return empty if head.nil?

    current = head
    items = 1
    loop do
      current = current.next
      items += 1
      break if current.nil?
    end
    puts "The \e[38;5;4msize\e[0m of the list is #{items}."
  end

  def at(index)
    return empty if head.nil?

    node_at = head
    begin
      (0...index.to_i).each { node_at = node_at.next }
    rescue StandardError
      return puts 'Out of range. Use a lower index (remember they start from zero.'
    end
    return puts "\e[94mNIL\e[0m" if node_at.nil?
    
    puts "The node \e[38;5;13mat\e[0m position #{index} is \e[1m#{node_at.data}\e[0m"
  end

  def pop
    return empty if head.nil?

    if head.next.nil?
      @head = nil
      @tail = nil
      return
    end
    current = head
    loop do
      break if current.next.next.nil?

      current = current.next
    end
    current.next = nil
    @tail = current
    puts 'Popped!'
  end

  def contains?(value)
    return puts "\e[36mtrue\e[0m" if head.data == value

    current = head
    loop do
      break if current.next.nil? || current.data == value

      current = current.next
    end
    puts "\e[36m#{current.data == value}\e[0m"
  end

  def find(value)
    return puts "\e[96m0\e[0m" if head.data == value

    current = head.next
    index = 1
    loop do
      break if current.data == value || current.next.nil?

      index += 1
      current = current.next
    end
    puts "\e[96m#{current.data == value ? index : nil}\e[0m"
  end

  def to_s(node = head)
    return print "( \e[94mNIL\e[0m )" if head.nil? || node.nil?

    print "( \e[95m#{node.data}\e[0m ) --> "
    to_s(node.next)
  end
end
