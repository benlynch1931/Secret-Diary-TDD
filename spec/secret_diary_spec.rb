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
end
