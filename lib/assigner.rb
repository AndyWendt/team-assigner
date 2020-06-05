class Assigner
  def initialize(guides, participants)
    @guides = guides
    @participants = participants
  end

  def teams
    [
        Team.new('guide a', ['person a', 'person b']),
        Team.new('guide b', ['person c'])
    ]
  end

  class Team
    def initialize(guide, participants)
      @guide = guide
      @participants = participants
    end

    attr_reader :guide, :participants
  end
end