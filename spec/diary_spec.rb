require 'diary'
require 'diary_access'

describe Diary do

  describe '#get_entries' do
    let (:diary_access) { instance_double "diary_access" }
    let (:subject) { Diary.new(diary_access) }

    before do
      allow(diary_access).to receive(:lock_status).and_return(true)
    end

    it 'returns locked after initialize' do
      expect(subject.get_entries).to eq "Locked!"
    end

    it 'returns entries after unlock' do
      allow(diary_access).to receive(:lock_status).and_return(false)


      2.times { subject.add_entry("New Message") }
      expect {subject.get_entries}.to output("Entries: \n \nNew Message\n----\nNew Message\n----\n").to_stdout
    end

  end

  describe '#add_entry' do
    let (:diary_access) { instance_double "diary_access" }
    let (:subject) { Diary.new(diary_access) }

    before do
      allow(diary_access).to receive(:lock_status).and_return(true)
    end

    it 'returns locked after initialize' do
      expect(subject.add_entry).to eq "Locked!"
    end

    it 'adds entries after unlock' do
      allow(diary_access).to receive(:lock_status).and_return(false)
      expect(subject.add_entry("Entry 1")).to eq ["Entry 1"]
    end

  end

  describe '#locked_status' do
    let (:diary_access) { instance_double "diary_access" }
    let (:subject) { Diary.new(diary_access) }

    before do
      allow(diary_access).to receive(:lock).and_return(true)
      allow(diary_access).to receive(:unlock).and_return(false)
      allow(diary_access).to receive(:lock_status).and_return(true)
    end

    it 'puts locked on initialize' do
      expect(subject.locked_status).to eq "Locked"
    end

    it 'puts unlocked after .unlock' do
      diary = Diary.new(DiaryAccess.new)
      diary.access_diary
      expect(diary.locked_status).to eq "Unlocked"
    end
  end

end
