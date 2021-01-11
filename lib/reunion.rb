class Reunion
  attr_reader :name,
              :activities
  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities.push(activity)
  end

  def total_cost
    @activities.sum do |activity|
      activity.total_cost
    end
  end

  def breakout
    breakout = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |participant, owed|
        breakout[participant] += owed
      end
    end
    breakout
  end

  def summary
    final_string = ""
    breakout.each do |name, owed|
       # "#{name}: #{owed}\n"
       final_string += "#{name}: #{owed}\n"
    end
    final_string[0..-2]
  end
end
