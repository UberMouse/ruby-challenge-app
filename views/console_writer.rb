class ConsoleWriter

  def print_line(line)
    puts line#.each_char {|c| putc c ; sleep 0.02; $stdout.flush }
  end

  def print_on_same_line(text_frag)
    print text_frag
  end

  def clear_screen
    system('clear')
  end

end
