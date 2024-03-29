# frozen_string_literal: true

RSpec.describe LogReader::Aggregator do
  let(:aggregator) { described_class.new(entries) }
  let(:entries) do
    [
      LogReader::Entry.new("/about", "1.2.2.2"),
      LogReader::Entry.new("/about", "1.2.2.2"),
      LogReader::Entry.new("/about", "2.2.2.2"),
      LogReader::Entry.new("/home", "1.2.2.2"),
      LogReader::Entry.new("/home", "1.2.2.2")
    ]
  end
  describe "#group" do
    subject(:group) { aggregator.group }
    it "should return a hash" do
      expect(group).to be_a(Hash)
    end
    it "should return a hash with 2 keys" do
      expect(group.keys.size).to eq(2)
    end
    it "should group entries by their path" do
      expect(group.keys).to match_array(["/about", "/home"])
    end

    it "stores total no of views for each path" do
    end
  end
end
