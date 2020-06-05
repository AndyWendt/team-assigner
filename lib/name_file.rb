class NameFile
  def initialize(file, storage)
    @file = file
    @storage = storage
  end

  def to_a
    storage.read(file).flatten
  end

  private

  attr_reader :file, :storage
end