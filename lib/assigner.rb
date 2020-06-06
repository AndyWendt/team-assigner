class Assigner
  HEADER_LINE = ['Guide', 'Count', 'Participants']

  def initialize(teams, storage = Storage.new)
    @teams = teams
    @storage = storage
  end

  def to_file(out_file)
    lines = [HEADER_LINE].tap do |lines|
      teams.all.each { |team| lines << [team.guide, team.count, *team.participants] }
    end

    storage.write_csv(out_file, lines)
  end

  private

  attr_reader :storage, :teams
end