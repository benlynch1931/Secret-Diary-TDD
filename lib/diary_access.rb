class DiaryAccess
  attr_reader :lock_status

  def initialize
    @lock_status = true
  end

  def lock
    @lock_status = true
  end

  def unlock
    @lock_status = false
  end

end
