
class Diary

  def initialize
    @diary_access = DiaryAccess.new
    @count = 0

  end
  def add_entry(entry)
    if @diary_access.lock_status == true
      return "Locked!"
    else
      return "Unlocked!"
    end
  end

  def get_entries
    if @diary_access.lock_status == true
      return "Locked!"
    end
  end

  def locked_status
    puts "Locked"
  end

  def access_diary
    @count += 1
    if @count % 2 == 0
      @diary_access.lock
    else
      @diary_access.unlock
    end

  end
end
