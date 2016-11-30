require_relative 'rspec_runner'
require_relative 'rspec_result'
require 'byebug'

# config = RSpec.configuration
# formatter = RSpec::Core::Formatters::JsonFormatter.new(config.output_stream)
# # create reporter with json formatter
# reporter =  RSpec::Core::Reporter.new(config)
# config.instance_variable_set(:@reporter, reporter)
# # internal hack
# # api may not be stable, make sure lock down Rspec version
# loader = config.send(:formatter_loader)
# notifications = loader.send(:notifications_for, RSpec::Core::Formatters::JsonFormatter)
# reporter.register_listener(formatter, *notifications)

# RSpec::Core::Runner.run(['spec/sample_spec.rb'])
runner = RSpecRunner.new()
result = runner.run

puts '#######################################'
puts "Tests Ran Total : #{result.executed}"
puts "Success : #{result.successes}"
puts "Failures : #{result.failures}"
puts "Pending : #{result.pendings}"
puts '#######################################'