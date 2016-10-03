module Turlang
  class Interpeter
    STACK_OPERATIONS = [:>>, :<<]
    IO_OPERATIONS = [:PRINT, :EXIT]

    def self.interpet program
      inter = Turlang::Interpeter.new
      program.split("\n").each do |line|
        next if line == ''
        if line =~ /\A\:(.*)\:\Z/
          line.strip!
          inter.new_label(line)
          next
        end

        if line =~ /\A\ \ [\*_A-Za-z\d].*\:\Z/
          line.strip!
          inter.new_condition(line[0..-2])
          next
        end

        line.strip!
        next if line == ''
        inter.add_command line
        break if line == "END"
      end
      inter
    end

    def initialize
      @stack = Stack.new
      @state_machine = StateMachine.new
      @io = IO.new
      @current_label = nil
      @current_conditional = nil
    end

    def new_label label
      @current_label = label
      @state_machine.add_label @current_label
    end

    def new_condition conditional
      raise "Syntax" if @current_label.nil?
      @current_conditional = conditional.to_sym
      @state_machine.add_condition @current_label, @current_conditional
    end

    def add_command command
      raise "Syntax" if @current_label.nil?
      raise "Syntax" if @current_conditional.nil?
      command = command.split(' ')
      real_command = [command[0].to_sym]
      real_command << command[1..-1] if command.count > 1
      @state_machine.add_command @current_label, @current_conditional, real_command
    end

    def is_label? label
      label = label.to_s
      label.start_with?(':') && label.end_with?(':')
    end

    def run
      loop do
        commands = @state_machine.commands(@stack.read)
        commands.each do |command|
          args = command[1]
          command = command[0]
          case
          when is_label?(command)
            @state_machine.next_label = command
          when STACK_OPERATIONS.include?(command)
            @stack.send(command)
          when IO_OPERATIONS.include?(command)
            @io.send(command.downcase, *args)
          else
            @stack.write(command)
          end
        end
      end
    end
  end
end
