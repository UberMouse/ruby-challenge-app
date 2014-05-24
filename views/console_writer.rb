class ConsoleWriter

  def print_line(line)
    puts line
  end

  def print_on_same_line(text_frag)
    print text_frag
  end

  def clear_screen
    system('clear')
  end

end
