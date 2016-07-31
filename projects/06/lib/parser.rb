load 'lib/command_type.rb'

class Parser
  include CommandType

  def initialize(filename)
    @asm = File.new(filename)
    @command = ''
  end

  def has_more_commands?()
    if (@asm.eof?)
      return false
    end

    return true
  end

  def advance()
    @command = remove_comments(@asm.readline.chomp())
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

