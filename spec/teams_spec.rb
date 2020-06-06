require 'rspec'
require 'teams'
require 'name_file_fake'

describe Teams do
  it 'sorts guides and participants into teams equally' do
    participants = NameFileFake.new(['person a', 'person b', 'person c'])
    guides = NameFileFake.new(['guide a', 'guide b'])

    result = described_class.new(guides, participants).all

    participants = participants.randomized
    guides = guides.randomized

    team1 = result[0]
    expect(team1.guide).to eq(guides[0])
    expect(team1.participants).to eq([participants[0], participants[2]])
    expect(team1.count).to eq(2)

    team2 = result[1]
    expect(team2.guide).to eq(guides[1])
    expect(team2.participants).to eq([participants[1]])
    expect(team2.count).to eq(1)
  end
end