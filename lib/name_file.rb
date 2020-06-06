class NameFile
  def initialize(file, randomizer = Randomizer.new, storage = Storage.new)
    @file = file
    @randomizer = randomizer
    @storage = storage
  end

  def randomized
    storage.read(file).flatten.tap { |array| randomizer.run(array) }
  end

  private

  attr_reader :file, :storage, :randomizer
end