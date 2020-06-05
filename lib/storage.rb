require 'csv'

class Storage
  def initialize(directory = "#{File.expand_path(File.dirname(__FILE__))}/../storage")
    @directory = directory
  end

  def exists?(file)
    File.file?(path(file))
  end

  def storage_directory
    directory
  end

  def path(file)
    "#{directory}/#{file}"
  end

  def delete(file)
    File.delete(path(file)) if exists?(file)
  end

  def write_csv(out_file, lines)
    CSV.open(path(out_file), "w") do |csv|
      lines.each { |line| csv << line }
    end
  end

  private

  attr_reader :directory
end