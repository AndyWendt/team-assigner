class Assigner
  HEADER_LINE = ['Guide', 'Count', 'Participants']
  def initialize(guides_file, participants_file, storage, randomizer)
    @guides_file = guides_file
    @participants_file = participants_file
    @storage = storage
    @randomizer = randomizer
  end

  def to_file(out_file)
    lines = [HEADER_LINE].tap do |lines|
      Teams.new(randomizer.run(guides_file), randomizer.run(participants_file))
          .all.each { |team| lines << [team.guide, team.count, team.participants.join(',')]}
    end

    storage.write_csv(out_file, lines)
  end

  private

  attr_reader :storage, :randomizer, :guides_file, :participants_file
end