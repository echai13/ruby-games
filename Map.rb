require "./Riddles.rb"
require "./Hangman.rb"
require "./RockPaperScissors.rb"
require "./Sudoku.rb"



class Map
  #4 levels the user has to pass
  $levels = {
    'riddles' => Riddles.new(),
    'hangman' => Hangman.new(),
    'rockpaperscissors' => RockPaperScissors.new(),
    'sudoku' => Sudoku.new()
  }

  #initialize Map
  def initialize(start_level)
    @start_level = start_level
    self.start()
  end

  #starts the game
  def start()
    count = 0
    @result = $levels['riddles'].enter()
    while @result != 'death' && @result != 'success'
      @result = $levels.values[count += 1].enter()
    end

    #if death then
    if @result == 'death'
      puts "You didn't save your loved one. You live miserably for the rest of your life. Peace out! "
    else #success
      puts "Congratulations! You've received the last item. But now you have to get back "
      puts "within a week. The only option you have is to be teleported back and to do so, "
      puts "you have to unlock the keys to the portal. Good luck! To be continued ..."
    end
  end

end
