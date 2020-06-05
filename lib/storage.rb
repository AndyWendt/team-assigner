class Storage
  def self.exists?(file)
    File.file?("#{storage_directory}/#{file}")
  end

  private

  def self.storage_directory
    current_directory = File.expand_path(File.dirname(__FILE__))
    "#{current_directory}/../storage"
  end
end