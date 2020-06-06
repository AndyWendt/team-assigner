class NameFileFake
  def initialize(output)
    @output = output
  end

  def randomized
    output
  end

  private

  attr_reader :output
end