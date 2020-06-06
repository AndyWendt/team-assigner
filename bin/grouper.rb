Dir.glob(File.join(File.dirname(__FILE__ ), '../lib/*.rb')).each do |file|
  require file
end


teams = Teams.new(NameFile.new('guides.txt'), NameFile.new('participants.txt'))

Assigner.new(teams).to_file('groups.csv')
