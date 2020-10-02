require_relative 'diary_access'
class Diary

  def initialize
    @diary_access = DiaryAccess.new
    @entries = []
  end

  def add_entry(entry = nil)
    if @diary_access.lock_status == true
      return "Locked!"
    else
      @entries.push(entry)
    end
  end

  def get_entries
    if @diary_access.lock_status == true
      return "Locked!"
    else
      puts "Entries: \n \n"
      @entries.each { |entry|
        puts entry
        puts "----"}
    end
  end

  def locked_status
    @diary_access.lock_status ? "Locked" : "Unlocked"
  end

  def access_diary
    @diary_access.lock_status ? @diary_access.unlock : @diary_access.lock
  end
end
