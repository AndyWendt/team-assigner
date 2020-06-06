Dir.glob(File.join(File.dirname(__FILE__ ), '../lib/*.rb')).each do |file|
  require file
end

Assigner.new.to_file('groups.csv')
