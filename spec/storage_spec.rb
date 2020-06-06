require 'rspec'
require 'storage'

describe Storage do
  it 'checks if a file exists' do
    expect(described_class.new.exists?('.gitignore')).to be_truthy
    expect(described_class.new.exists?('nothing.txt')).to be_falsey
  end

  it 'overwrites a file' do
    file = 'file.test'
    instance = described_class.new('spec/storage')
    instance.write_csv(file, [['one']])
    instance.write_csv(file, [['two']])
    expect(instance.read(file)[0][0]).to eq('two')
  end
end