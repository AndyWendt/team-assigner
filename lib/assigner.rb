require 'storage'

class Assigner
  def initialize(guides_file, participants_file)
  end

  def to_file(out_file)
    Storage.new.write_csv(out_file, [
        ['one', 'two', 'three'],
    ])
  end
end