require 'z/version'

describe "version" do
  it "returns 0.1.0" do
    expect(Z::VERSION).to eq("0.1.0")
  end
end
