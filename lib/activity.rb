class Activity
  attr_reader :name,
              :participants
              # :total_cost

  def initialize(name)
    @name = name
    @participants = {}
    # @total_cost = 0
  end

  def add_participant(participant, cost)
    @participants[participant] = cost
  end

  def total_cost
    @participants.values.sum
    # @participants.sum do |participant, cost|
    #   cost
    # end

    # total = 0
    # @participants.each do |participant, cost|
    #   total += cost
    # end
    # total
  end
end
