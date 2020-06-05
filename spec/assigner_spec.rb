require 'rspec'
require 'assigner'

describe Assigner do
  it 'sorts guides and participants into teams so that they are equal' do
    participants = ['person a', 'person b', 'person c']
    guides = ['guide a', 'guide b']

    result = Assigner.new(guides, participants).teams

    team1 = result[0]
    expect(team1.guide).to eq(guides[0])
    expect(team1.participants).to eq([participants[0], participants[1]])

    team2 = result[1]
    expect(team2.guide).to eq(guides[1])
    expect(team2.participants).to eq([participants[2]])
  end
end