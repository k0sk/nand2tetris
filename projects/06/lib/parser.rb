load 'lib/command_type.rb'

class Parser
  include CommandType

  def initialize(filename)
    @asm = File.new(filename)
    @command = ''
  end

  def has_more_commands?()
    while not @asm.eof?
      @next_command = remove_comments(@asm.readline).strip

      if not @next_command.empty?
        return true
      end
    end

    return false
  end

  def advance()
    @command = @next_command
  end

  def command_type()
    if /@/.match(@command)
      return A_COMMAND
    elsif /=|;/.match(@command)
      return C_COMMAND
    end

    return L_COMMAND
  end

  def symbol()
    return @command.delete('@()')
  end

  def dest()
    return @command.split(/=|;/)[0]
  end

  def comp()
    return @command.split('=')[1]
  end

  def jump()
    return @command.split(';')[1]
  end

  private
  def remove_comments(s)
    return s.gsub(/\/\/.*/, '')
  end
end
