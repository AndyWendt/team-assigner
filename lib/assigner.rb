class Assigner
  def initialize(guides, participants)
    @guides = guides
    @participants = participants
  end

  def teams
    team1 = Team.new('guide a')
    team1.add_participant('person a')
    team1.add_participant('person b')

    team2 = Team.new('guide b')
    team2.add_participant('person c')

    [team1, team2]
  end

  class Team
    def initialize(guide)
      @guide = guide
      @participants = []
    end

    def add_participant(participant)
      @participants.push(participant)
    end

    attr_reader :guide, :participants
  end
end