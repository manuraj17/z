require 'z/core'
require 'z/data_store'

describe Z::DataStore do
  let(:test_ds_name) { "test_ds.db" }
  context "when no database exists" do
    before do
      File.delete(test_ds_name) if File.exist?(test_ds_name)
    end

    it "creates a new datastore" do
      expect(File.exist?(test_ds_name)).to be_falsey

      @ds = described_class.new.load_database test_ds_name

      expect(File.exist?(test_ds_name)).to be_truthy
    end

    after do
      File.delete(test_ds_name) if File.exist?(test_ds_name)
    end
  end

  context "when database exists" do
    before do
      File.delete(test_ds_name) if File.exist?(test_ds_name)
      
      @ds = described_class.new
      @ds.load_database test_ds_name
      @ds.prepare_datastore
      @ds.store("/home/book/mark")
    end

    after do
      File.delete(test_ds_name) if File.exist?(test_ds_name)
    end

    it "uses the existing datastore" do
      expect(File.exist?(test_ds_name)).to be_truthy
      expect(@ds.db).not_to be_nil
    end

    it "fetches data from the existing datastore" do
      result = @ds.fetch "mark"

      expect(result.flatten).to match_array(["/home/book/mark"])
    end

    it "adds entry to the existing datastore" do
      @ds.store "/home/another/book/mark"

      result = @ds.fetch "another"

      expect(result.flatten).to match_array(["/home/another/book/mark"])
    end

    it "fetches multiple matching results" do
      @ds.store "/home/another/book/mark"

      result = @ds.fetch "mark"

      expect(result.flatten).to match_array(["/home/another/book/mark", "/home/book/mark"])
    end
  end
end
