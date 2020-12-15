# frozen-string-literal: true

# Module for commands and method control
module Commands
  def welcome
    puts %(
      Welcome to the \e[34;1mLinked List\e[0m program.
      This program allows you to make and modify \e[1mLinked Lists\e[0m using a set of commands.
      A linked list is a basic data structure which uses \e[3mpointers\e[0m to "link" items in sequential order.
      This allows you to dynamically the size of a list (many languages have static arrays, which have fixed sizes).
      Hope you enjoy it, let me know if you have any suggestions!
      )
    commands
  end

  def commands
    options = [
                [2, 'push --> add value to the end of the list'], [1, 'pop --> remove the last item in the list'],
                [3, 'shift --> add value to the start of the list'], [4, 'size --> number of items in the list'],
                [13, 'at --> item at specified index'], [77, 'has --> true if list contains specified value else nil'],
                [105, 'find --> find a certain value, returns the index'], [137, 'display --> shows the list'],
                [159, 'clear --> clears screen'], [97, 'c or commands --> lists these commands']
              ]
    puts 'The commands are...'
    options.each { |option| print "\e[38;5;#{option[0]}m##{option[1]}\e[0m\n" }
  end

  def use
    method_hash = {
      'push' => 'append',
      'pop' => 'pop',
      'shift' => 'prepend',
      'size' => 'size',
      'at' => 'at',
      'has' => 'contains?',
      'find' => 'find',
      'display' => 'to_s',
      'clear' => 'clear',
      'c' => 'commands',
      'commands' => 'commands'
    }
  end
end

def call_method(method)
  puts method
  if %w[size pop to_s commands].include? method
    send(method)
  elsif %w[append contains? prepend find].include? method
    puts 'Please enter a value'
    value = gets.chomp
    send(method, value)
  elsif method == 'clear'
    system('clear')
  else
    puts 'Please enter the index you want to look at (0 gets the first item)'
    index = gets.chomp.to_i
    send(method, index)
  end
end

def empty
  puts 'List is empty'
end
