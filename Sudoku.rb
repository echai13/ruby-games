class Sudoku 
  def enter()
    puts "You need only one more ingredient for your anecdote. You've arrived at "
    puts "Death Valley, California. You are lastly tested on your logical thinking "
    puts "with a round of Sudoku. In this 4 by 4 sudoku, you just have to account "
    puts "for the rows and columns, no diagonals or boxes. After you solved it, enter the numbers "
    puts "diagonally, bottom to up, to form a 4-digit unlock code. You will have only one try. "
    puts ""
    puts "Are you ready for this challenge? Let's start!"
    puts ""


    puts "3 2 - -"
    puts "- 3 - 1"
    puts "4 - 3 -"
    puts "- - - -"
    puts ""

    unlock_code = "1144"
    puts "Please enter the 4-digit code:"
    print "> "

    input = $stdin.gets.chomp

    if input == unlock_code
      puts "You've successfully solved the riddles! This ostrich's feather is the last "
      puts "ingredient you need."
      puts ""
      return 'success'
    else
      puts "You are unfortunately captured and die from thirst because of the humid weather."
      return 'death'
    end
  end
end







    #3 2 1 4
    #2 3 4 1
    #4 1 3 2
    #1 4 2 3
