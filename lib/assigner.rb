require 'teams'
require 'name_file'
require 'randomizer'
require 'storage'

class Assigner
  HEADER_LINE = ['Guide', 'Count', 'Participants']

  def initialize(storage = Storage.new, randomizer = Randomizer.new, participants_file = NameFile.new('participants.txt', storage), guides_file = NameFile.new('guides.txt', storage))
    @storage = storage
    @randomizer = randomizer
    @participants_file = participants_file
    @guides_file = guides_file
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