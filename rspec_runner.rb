require 'rspec'
require 'rspec/core/formatters/json_formatter'
require_relative 'rspec_result'

class RSpecRunner

  FILES_TO_RUN = ['spec/sample_spec.rb']

  def initialize()
    config = RSpec.configuration
    @formatter = RSpec::Core::Formatters::JsonFormatter.new(config.output_stream)
    # create reporter with json formatter
    reporter =  RSpec::Core::Reporter.new(config)
    config.instance_variable_set(:@reporter, reporter)
    # internal hack
    # api may not be stable, make sure lock down Rspec version
    loader = config.send(:formatter_loader)
    notifications = loader.send(:notifications_for, RSpec::Core::Formatters::JsonFormatter)
    reporter.register_listener(@formatter, *notifications)
  end

  def run
    RSpec::Core::Runner.run(FILES_TO_RUN)
    RSpecResult.new(@formatter)
  end
end