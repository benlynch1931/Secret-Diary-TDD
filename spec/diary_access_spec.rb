require 'diary_access'

describe DiaryAccess do

  it 'returns true lock status on initialize' do
    expect(subject.lock_status).to eq true
  end

  it 'returns false lock status after .unlock' do
    subject.unlock
    # unlock once
    expect(subject.lock_status).to eq false
  end

  it 'returns true lock status after .lock' do
    subject.lock
    expect(subject.lock_status).to eq true
  end
end
