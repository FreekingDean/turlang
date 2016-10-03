module Turlang
  class StateMachine
    attr_writer :next_label

    def initialize
      @labels = {}
      @next_label = nil
    end

    def add_label label
      @labels[label] = []
      @next_label = label if @next_label.nil?
    end

    def add_condition label, condition
      @labels[label] << {
        conditional: condition,
        commands: []
      }
    end

    def add_command label, condition, command
      get_condition(label, condition)[:commands] << command
    end

    def match_condition label, condition
      @labels[label.to_s].detect do |conditional|
        conditional[:conditional] == :* || conditional[:conditional] == condition
      end.tap do |conditional|
        raise "Condition #{condition} not found for label #{label}" if conditional.nil?
      end
    end

    def get_condition label, condition
      @labels[label].detect do |conditional|
        conditional[:conditional] == condition
      end.tap do |conditional|
        raise "Condition #{condition} not found for label #{label}." if conditional.nil?
      end
    end

    def commands symbol
      match_condition(@next_label, symbol)[:commands]
    end
  end
end
