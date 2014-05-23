class Eval
  # Evals input in a separate thread with $SAFE set to 4
  # @param [String] input
  # @return [String] eval'd input
  def eval_safe(input)

    execution_limit = 2

    eval_thread = Thread.new {

      @answer = eval(input)

    }

    start_time = Time.now
    while eval_thread.alive? and Time.now - start_time < execution_limit
      sleep 0.1
    end

    if eval_thread.alive?
      eval_thread.terminate
    end

    @answer
  end

end