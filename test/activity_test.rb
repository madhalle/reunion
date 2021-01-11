require "minitest/test"
require "minitest/autorun"
require "minitest/pride"
require "./lib/activity"

class ActivityTest < Minitest::Test
  def setup
    @activity = Activity.new("Brunch")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Activity, @activity
    assert_equal "Brunch", @activity.name
    assert_equal ({}), @activity.participants
  end

  def test_it_can_add_participants
    @activity.add_participant("Maria", 20)
    assert_equal ({"Maria" => 20}), @activity.participants

    @activity.add_participant("Luther", 40)
    expected = {"Maria" => 20,
                "Luther" => 40}
    assert_equal expected, @activity.participants
  end

  def test_it_has_total_cost
    @activity.add_participant("Maria", 20)

    assert_equal 20, @activity.total_cost

    @activity.add_participant("Luther", 40)
    assert_equal 60, @activity.total_cost
  end
end
