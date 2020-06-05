class Assigner
  HEADER_LINE = ['Guide', 'Count', 'Participants']
  def initialize(guides_file, participants_file, storage)
    @guides_file = guides_file
    @participants_file = participants_file
    @storage = storage
  end

  def to_file(out_file)
    lines = [
        HEADER_LINE,
        ['Guide One', '1', 'Person One'],
        ['Guide Two', '1', 'Person Two']
    ]
    storage.write_csv(out_file, lines)
  end

  private

  attr_reader :storage
end