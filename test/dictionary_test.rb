require 'test_helper'
require 'colorize'

class DictionaryTest < Minitest::Test
  # This line includes all default Spout Dictionary tests
  include Spout::Tests

  # This line provides access to @variables, @forms, and @domains
  # iterators that can be used to write custom tests
  include Spout::Helpers::Iterators

  VALID_UNITS = ['main sleeps', 'kilograms', 'years', 'days', 'minutes', 'counts', 'breaks', 'bouts', 'metabolic equivalents', 'kilocalories', 'kilocalories per hour', 'counts', 'counts per minute', 'steps', 'steps per minute', 'epochs', '']

  @variables.select{|v| ['numeric','integer'].include?(v.type)}.each do |variable|
    define_method("test_units: "+variable.path) do
      message = "\"#{variable.units}\"".colorize( :red ) + " invalid units.\n" +
                "             Valid types: " +
                VALID_UNITS.sort.collect{|u| u.inspect.colorize( :white )}.join(', ')
      assert VALID_UNITS.include?(variable.units), message
    end
  end

end
