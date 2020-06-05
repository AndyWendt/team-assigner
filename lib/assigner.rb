class Assigner
  HEADER_LINE = ['Guide', 'Count', 'Participants']
  def initialize(guides_file, participants_file, storage)
    @guides_file = guides_file
    @participants_file = participants_file
    @storage = storage
  end

  def to_file(out_file)
    lines = [HEADER_LINE].tap do |lines|
      Teams.new(@guides_file.to_a, @participants_file.to_a)
          .all.each { |team| lines << [team.guide, team.count, team.participants.join(',')]}
    end

    storage.write_csv(out_file, lines)
  end

  private

  attr_reader :storage
end