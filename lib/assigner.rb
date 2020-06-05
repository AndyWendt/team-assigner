require 'storage'

class Assigner
  def initialize(guides_file, participants_file, storage)
    @guides_file = guides_file
    @participants_file = participants_file
    @storage = storage
  end

  def to_file(out_file)
    storage.write_csv(out_file, [
        ['one', 'two', 'three'],
    ])
  end

  private

  attr_reader :storage
end