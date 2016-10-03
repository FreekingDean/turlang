class Interpeter
  def initialize()
    @stacks = {}
  end

  def add_stack stack_name
  end

  def add_value stack_name, value
  end

  def >> stack
  end

  def < from_stack, to_stack
  end

  def PRINT message
  end

  def EXIT code
    exit code
  end
end

code = File.read('./palen.tl')

