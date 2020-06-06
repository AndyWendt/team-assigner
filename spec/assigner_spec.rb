require 'rspec'
require 'assigner'
require 'storage'
require 'csv'
require 'name_file'
require 'randomizer_fake'

describe Assigner do
  before do
    Storage.new.delete('out.csv')
  end

  after do
    Storage.new.delete('out.csv')
  end

  it 'creates a list of teams from a file' do
    storage = Storage.new('spec/storage')
    out_file = 'out.csv'
    randomizer = RandomizerFake.new

    described_class.new(storage, randomizer).to_file(out_file)
    expect(storage.exists?(out_file)).to be_truthy
    result = storage.read(out_file)
    expect(result[0]).to eq(Assigner::HEADER_LINE)
    expect(result[1]).to eq(['Guide One', '2', 'Person One', 'Person Three'])
    expect(result[2]).to eq(['Guide Two', '1', 'Person Two'])
  end
end