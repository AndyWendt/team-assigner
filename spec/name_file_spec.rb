require 'rspec'
require 'name_file'
require 'storage'

describe NameFile do
  it "returns the names from a file" do
    storage = Storage.new('spec/storage')
    result = NameFile.new('guides.txt', storage).to_a
    expect(result).to eq(['Guide One', 'Guide Two'])
  end
end