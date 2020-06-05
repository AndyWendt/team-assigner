require 'csv'

class Storage
  def initialize(directory = "#{File.expand_path(File.dirname(__FILE__))}/../storage")
    @directory = directory
  end

  def exists?(file)
    File.file?(path(file))
  end

  def self.exists?(file)
    self.new.exists?(file)
  end

  def storage_directory
    directory
  end

  def self.storage_directory
    self.new.storage_directory
  end

  def path(file)
    "#{directory}/#{file}"
  end

  def self.path(file)
    self.new.path(file)
  end

  def delete(file)
    File.delete(path(file)) if exists?(file)
  end

  def self.delete(file)
    self.new.delete(file)
  end

  def write_csv(out_file, lines)
    CSV.open(path(out_file), "w") do |csv|
      lines.each { |line| csv << line }
    end
  end

  def self.write_csv(out_file, lines)
    self.new.write_csv(out_file, lines)
  end

  private

  attr_reader :directory
end