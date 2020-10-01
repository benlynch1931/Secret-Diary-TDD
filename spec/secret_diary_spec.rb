require 'secret_diary.rb'

describe Diary do

  describe "#locked_status" do

    it "returns locked status of diary" do
      subject = Diary.new
      expect(subject.locked_status).to eq true
    end


    it "sets locked status to false when run .unlock" do
      subject = Diary.new
      subject.unlock
      expect(subject.locked_status).to eq false
    end

  # For this, I had removed the init method to ensure lock method works
    it "sets locked status to true when run .unlock" do
      subject = Diary.new
      subject.lock
      expect(subject.locked_status).to eq true
    end
  end

  describe "#add_entry" do



    it "returns false to .add_entry as locked_status is true" do
      expect(subject.add_entry).to eq false
    end

    it "returns nil array to .add_entry when .unlock is run first" do
      subject = Diary.new
      subject.unlock
      expect(subject.add_entry).to eq [nil]
    end

    it "adds an entry to the diary" do
      subject = Diary.new
      subject.unlock
      expect(subject.add_entry("Entry 1")).to eq ["Entry 1"]
    end

    it "adds two entry to the diary" do
      subject = Diary.new
      subject.unlock
      subject.add_entry("Entry 1")
      expect(subject.add_entry("Entry 2")).to eq ["Entry 1", "Entry 2"]
    end
  end

  describe "#get_entries" do


    it "returns false to .get_entries as locked_status is true" do
      expect(subject.get_entries).to eq false
    end

    it "returns empty array to .get_entries when .unlock is run first" do
      subject = Diary.new
      subject.unlock
      expect(subject.get_entries).to eq []
    end

    it "`put`es entries added when .get_entry called" do
      subject = Diary.new
      subject.unlock
      subject.add_entry("Entry 1")
      subject.add_entry("Entry 2")
      expect {subject.get_entries}.to output("Entries: \n \nEntry 1\n----\nEntry 2\n----\n").to_stdout
    end
  end
end
