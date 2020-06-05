class Teams
  def initialize(guides, participants)
    @teams = guides.map{ |guide| Team.new(guide) }
    @participants = participants
  end

  def all
    participants_copy = @participants.clone.reverse

    until participants_copy.empty?
      @teams.each do |team|
        participant = participants_copy.pop
        team.add_participant(participant) if participant
        team
      end
    end

    @teams
  end

  class Team
    def initialize(guide)
      @guide = guide
      @participants = []
    end

    def add_participant(participant)
      @participants.push(participant)
    end

    def count
      @participants.count
    end

    attr_reader :guide, :participants
  end
end