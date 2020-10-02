require 'diary_access'

describe DiaryAccess do

  it 'returns true lock status on initialize' do
    expect(subject.lock_status).to eq true
  end

  it 'returns false lock status after .unlock' do
    subject.unlock
    # unlock once
    expect(subject.lock_status).to eq false
    # lock and the nunlock again
    subject.lock
    subject.unlock
    expect(subject.lock_status).to eq false
  end
end
