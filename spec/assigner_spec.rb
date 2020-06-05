require 'rspec'
require 'assigner'
require 'storage'
require 'csv'

describe Assigner do
  before do
    Storage.new.delete('out.csv')
  end

  after do
    Storage.new.delete('out.csv')
  end

  it 'creates a list of teams from a file' do
    participants_file = 'participants.txt'
    guides_file = 'guides.txt'
    out_file = 'out.csv'
    storage = Storage.new

    described_class.new(guides_file, participants_file, storage).to_file(out_file)
    csv = CSV.read(storage.path(out_file))
    expect(storage.exists?(out_file)).to be_truthy
  end
end