require 'rspec'
require 'storage'

describe Storage do
  it 'checks if a file exists' do
    expect(Storage.exists?('.gitignore')).to be_truthy
    expect(Storage.exists?('nothing.txt')).to be_falsey
  end
end