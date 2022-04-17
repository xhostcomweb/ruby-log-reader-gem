RSpec.describe LogReader::Aggregator do 
  let(:aggregator) { described_class.new(entries) }
  let(:entries) {
       [
      LogReader::Entry.new("/about", "1.2.2.2"),
      LogReader::Entry.new("/about", "1.2.2.2"),
      LogReader::Entry.new("/about", "2.2.2.2"),
      LogReader::Entry.new("/home", "1.2.2.2"),
      LogReader::Entry.new("/home", "1.2.2.2")
       ] 
    } 
describe "#group" do 
    subject(:group) { aggregator.group }
    it "should return a hash" do 
        expect(group).to be_a(Hash)
    end
    it "should return a hash with 2 keys" do 
        expect(group.keys.size).to eq(2)
    end 
    it "should group entries by their path" do
      expect(group.keys).to match_array(["/about","/home"])
    end 

    it "stores total no of views for each path" do
        expect(group["/about"].total).to eq(3)
    end
end
end
