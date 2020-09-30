require 'secret_diary.rb'

describe Diary do

  it "returns locked status of diary" do
    subject = Diary.new
    expect(subject.locked_status).to eq true
  end

  it "responds to an .unlock method" do
    expect(subject).to respond_to(:unlock)
  end

  it "sets locked status to false when run .unlock" do
    subject = Diary.new
    subject.unlock
    expect(subject.locked_status).to eq false
  end
end
