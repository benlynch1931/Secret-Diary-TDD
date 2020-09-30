require 'secret_diary.rb'

describe Diary do

  it "returns locked status of diary" do
    subject = Diary.new
    expect(subject.locked).to eq true
  end
end
