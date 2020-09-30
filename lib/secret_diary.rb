class Diary
  attr_reader :locked_status

  def initialize
    @locked_status = true
  end

  def unlock
    @locked_status = false
  end
end
