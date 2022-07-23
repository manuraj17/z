require 'z/core'
require 'z/data_store'

describe Z::Core do
  let(:ds) { instance_double(Z::DataStore) }

  it "stores the param with given data store" do
    expect(ds).to receive(:fetch).with("code").and_return([["~/user/code"]])

    result = described_class.new(ds).recommendation("code")

    expect(result).to eq(["~/user/code"])
  end

  it "returns path that matches param from data store" do
    expect(ds).to receive(:store).with("~/user/code").and_return(true)

    result = described_class.new(ds).store("~/user/code")

    expect(result).to be_truthy
  end
end
