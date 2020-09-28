# clock_test.rb

require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/clock'

Minitest::Reporters.use!

# The describe block indicates that this contains a suite of tests.
# Minitest will run these tests together and any instance variables created inside this block
# will be shared among the test cases.
#
# Now we'll create an it block which is a test-case.
# Each describe block can have many it blocks inside it and even many describe blocks.
# Each it block however should focus on testing one specific thing,
# while describe blocks are used to group a set of tests.
#
# So we can add an expectation which is a method call that describes a condition
# it expects the given item to meet. In this case we need to expect that if we call clock,
# it will return a string. Expectations typically start with must_ or wont_.

describe "clock" do
  it "will return a string" do
    # Arrange
    hours = 8
    minutes = 14
    seconds = 27

    # Act
    time = clock(hours, minutes, seconds)

    # Assert
    # the `clock` method must return a string
    expect(time).must_be_instance_of String
  end

  it "will return a string formatted in hh:mm:ss format" do
    # Arrange
    hours = 11
    minutes = 14
    seconds = 27

    # Act
    time = clock(hours, minutes, seconds)

    # Assert
    expect((time)).must_equal "11:14:27"
  end

  it "will display leading zeros for numbers smaller than 10" do
    time = clock(11, 8, 14)
    expect(time).must_equal "11:08:14"

    time = clock(8, 11, 14);
    expect(time).must_equal "08:11:14"

    time = clock(11, 14, 8);
    expect(time).must_equal "11:14:08"
  end

  it "will raise an error when given an invalid argument" do
    expect {
      clock(25, 14, 8)
    }.must_raise ArgumentError

    expect {
      clock(11, 60, 8)
    }.must_raise ArgumentError

    expect {
      clock(11, 14, 60)
    }.must_raise ArgumentError

    expect {
      clock(-23, 14, 8)
    }.must_raise ArgumentError

    expect {
      clock(11, -17, 8)
    }.must_raise ArgumentError

    expect {
      clock(11, 14, -8)
    }.must_raise ArgumentError
  end
end
