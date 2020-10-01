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

# For this, I had removed the init method to ensure lock method works
  it "sets locked status to true when run .unlock" do
    subject = Diary.new
    subject.lock
    expect(subject.locked_status).to eq true
  end

  it "sets locked status to true when run .unlock then .lock" do
    subject = Diary.new
    subject.unlock
    subject.lock
    expect(subject.locked_status).to eq true
  end

  it "responds to an .add_entry method" do
    expect(subject).to respond_to(:add_entry)
  end

  it "returns false to .add_entry as locked_status is true" do
    expect(subject.add_entry).to eq false
  end

  it "returns true to .add_entry when .unlock is run first" do
    subject = Diary.new
    subject.unlock
    expect(subject.add_entry).to eq true
  end
end
