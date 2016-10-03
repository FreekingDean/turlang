module Turlang
  class IO
    def print message
      puts message.match(/\"(.*)\"/)[1]
    end

    def exit code
      Kernel.exit code.to_i
    end
  end
end
