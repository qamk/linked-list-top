# frozen-string-literal: true

require_relative 'lib/linked_list.rb'

# Main interface class
class Main
  def initialize
    LinkedList.new
    continue
  end

  def continue
    loop do
      print 'Press q to quit the linked list program, anything else will start a new Linked List: '
      break if gets.chomp.downcase == 'q'

      LinkedList.new
    end
  end
end
Main.new
