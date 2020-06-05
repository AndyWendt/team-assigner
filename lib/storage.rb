require 'csv'

class Storage
  def self.exists?(file)
    File.file?(path(file))
  end

  def self.storage_directory
    current_directory = File.expand_path(File.dirname(__FILE__))
    "#{current_directory}/../storage"
  end

  def self.path(file)
    "#{storage_directory}/#{file}"
  end

  def self.delete(file)
    File.delete(path(file)) if exists?(file)
  end

  def self.write_csv(out_file, lines)
    CSV.open(path(out_file), "w") do |csv|
      lines.each { |line| csv << line }
    end
  end
end