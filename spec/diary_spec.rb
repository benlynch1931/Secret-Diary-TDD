require 'diary'
require 'diary_access'

describe Diary do

  describe '#get_entries' do

    it 'returns locked after initialize' do
      expect(subject.get_entries).to eq "Locked!"
    end

    it 'returns entries after unlock' do
      subject.access_diary
      # Called before adding entries
      expect { subject.get_entries }.to output("Entries: \n \n").to_stdout
      # called after adding entries
      subject.add_entry("Entry 1")
      subject.add_entry("Entry 2")
      expect {subject.get_entries}.to output("Entries: \n \nEntry 1\n----\nEntry 2\n----\n").to_stdout
    end

    it 'returns locked after .unlock then .lock' do
      subject.access_diary
      subject.get_entries
      subject.access_diary
      expect(subject.get_entries).to eq "Locked!"
    end

  end

  describe '#add_entry' do

    it 'returns locked after initialize' do
      expect(subject.add_entry).to eq "Locked!"
    end

    it 'returns array after unlock' do
      subject.access_diary
      # Call method and use default value
      expect(subject.add_entry).to eq [nil]
      # Call method and use given value
      expect(subject.add_entry("Entry 1")).to eq [nil, "Entry 1"]
    end

    it 'returns locked after .unlock then .lock' do
      subject.access_diary
      subject.add_entry("Entry 1")
      subject.access_diary
      expect(subject.add_entry).to eq "Locked!"
    end
  end

  it 'returns locked status for diary instantiation' do
    expect(subject.locked_status).to eq "Locked"
  end

  it 'returns unlocked status for diary after .unlock' do
    subject.access_diary
    expect(subject.locked_status).to eq "Unlocked"
  end

end
