class Diary
  attr_reader :locked_status
  attr_reader :entries


  def initialize
    @locked_status = true
    @entries = []
  end

  def unlock
    @locked_status = false
  end

  def lock
    @locked_status = true
  end

  def add_entry(entry = nil)
    if @locked_status == true
      return false
    else
      @entries.push(entry)
    end
  end

  def get_entries
    if @locked_status == true
      return false
    else
      puts "Entries: \n \n"
      @entries.each { |entry|
        puts entry
        puts "----"
      }
    end
  end
end
