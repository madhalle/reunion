require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
  end

  def test_it_exists_and_has_attributes
    assert_equal "1406 BE", @reunion.name
    assert_equal [], @reunion.activities
  end

  def test_it_can_add_activity
    @reunion.add_activity(@activity_1)
    assert_equal [@activity_1], @reunion.activities
  end

  def test_total_cost
    @activity_1.add_participant("Maria", 20)

    @activity_1.add_participant("Luther", 40)

    @reunion.add_activity(@activity_1)

    assert_equal 60, @reunion.total_cost
  end

  def test_breakout_and_summary
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)

    @reunion.add_activity(@activity_1)

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    @reunion.add_activity(activity_2)
    assert_equal 180, @reunion.total_cost

    expected = {"Maria" => -10,
                "Luther" => -30,
                "Louis" => 40}
    assert_equal expected, @reunion.breakout

    summary_string = "Maria: -10\nLuther: -30\nLouis: 40"
    assert_equal summary_string, @reunion.summary
    puts @reunion.summary
  end
end
#
#
#

# pry(main)> reunion.summary
# # => "Maria: -10\nLuther: -30\nLouis: 40"
#
# pry(main)> puts reunion.summary
# Maria: -10
# Luther: -30
# Louis: 40
# ```
