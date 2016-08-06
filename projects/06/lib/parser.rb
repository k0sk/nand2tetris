load 'lib/command_type.rb'

class Parser
  def initialize(filename)
    @asm = File.new(filename)
    @command = ''
  end

  def has_more_commands?()
    while !@asm.eof?
      @next_command = remove_comments(@asm.readline).strip

      return true unless @next_command.empty?
    end

    return false
  end

  def advance()
    @command = @next_command
  end

  def command_type()
    if /@/.match(@command)
      return CommandType::A_COMMAND
    elsif /=|;/.match(@command)
      return CommandType::C_COMMAND
    end

    return CommandType::L_COMMAND
  end

  def symbol()
    return @command.delete('@()')
  end

  def parse()
    contains_dest = /=/.match(@command)
    contains_jump = /;/.match(@command)

    if contains_dest && contains_jump
      @c_command = @command.split(/=|;/)
    elsif contains_dest
      @c_command = @command.split('=') + [nil]
    elsif contains_jump
      @c_command = [nil] + @command.split(';')
    end
  end

  def dest()
    return @c_command[0]
  end

  def comp()
    return @c_command[1]
  end

  def jump()
    return @c_command[2]
  end

  private
  def remove_comments(s)
    return s.gsub(/\/\/.*/, '')
  end
end
