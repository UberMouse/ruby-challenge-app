require 'curses'

class ConsoleInterface

  BACKSPACE = 127
  ENTER = 10

  def initialize
    Curses.noecho
    @window = Curses::Window.new(0, 0, 0, 0)
    @window.keypad(true)
  end

  def print_line(line)
    window << line
    window.setpos(window.cury+1, 0)
    window.refresh
  end

  def print_on_same_line(text_frag)
    window << text_frag
    window.refresh
  end

  def clear_screen
    window.clear
  end

  def get_char
    window.getch
  end

  def get_line
    line = ''
    until (input = window.getch) == ENTER
      if input == Curses::Key::LEFT
        window.setpos(window.cury, window.curx-1)
      elsif input == Curses::Key::RIGHT
        window.setpos(window.cury, window.curx+1)
      elsif input == Curses::Key::DOWN
        window.setpos(1, 1)
      elsif input == BACKSPACE
        window.delch
        window.setpos(window.cury, window.curx - 1)
        window << ' '
        window.setpos(window.cury, window.curx - 1)
      else
        window << input.to_s
        line << input
      end
    end
    line
  end

  private
  attr_reader :window
end
