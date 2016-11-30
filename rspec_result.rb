class RSpecResult
  def initialize(formatter)
    @output = formatter.output_hash
  end

  def executed
    summary[:example_count]
  end

  def successes
    summary[:example_count] - summary[:failure_count] - summary[:pending_count]
  end

  def failures
    summary[:failure_count]
  end

  def pendings
    summary[:pending_count]
  end

  private

  def summary
    @output[:summary]
  end
end