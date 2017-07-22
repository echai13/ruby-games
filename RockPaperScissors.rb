class RockPaperScissors 
  $tries = 2
  $passed = false
  $next_level = ''
  $my_score = 0
  $your_score = 0

  def enter()

    puts "You've tested your intelligence in the last town. You've journeyed for "
    puts "two weeks and have finally reached South Pass City, Wyoming. This time your luck "
    puts "is tested. You have to win 2 out of 3 times in this game of rock-paper-scissors "
    puts "and you'll get 2 lives. If you lose, you will be sold to work in the coal mines "
    puts "and because of the horrible conditions, die from lung cancer."



    @weapons = ["rock", "paper", "scissors"]
    while !$passed
      index_of_weapon = rand(0..2)
      puts "Please type rock, paper, or scissors."
      print "> "

      input = $stdin.gets.chomp.downcase
      our_weapon = @weapons[index_of_weapon]
      puts "I choose #{our_weapon}."

      if input == "rock"
        if our_weapon == "rock"
          check_score(0, $my_score, $your_score)
        elsif our_weapon == "paper"
          check_score(1, $my_score += 1, $your_score)
        else
          check_score(2, $my_score, $your_score += 1)
        end
      elsif input == "paper"
        if our_weapon == "paper"
          check_score(0, $my_score, $your_score)
        elsif our_weapon == "scissors"
          check_score(1, $my_score += 1, $your_score)
        else
          check_score(2, $my_score, $your_score += 1)
        end
      elsif input == "scissors"
        if our_weapon == "scissors"
          check_score(0, $my_score, $your_score)
        elsif our_weapon == "rock"
          check_score(1, $my_score += 1, $your_score)
        else
          check_score(2, $my_score, $your_score += 1)
        end
      else
        puts "You've entered an incorrect weapon. Try again."
      end
    end
    return $next_level
  end

  def check_score(comp, my_score, your_score)
    results = ["It's a tie. Score: #{my_score} - #{your_score}",
      "You lose. Score: #{my_score} - #{your_score}",
      "You win. Score: #{my_score} - #{your_score}"]

    puts results[comp]
    puts ""
    if my_score > 1 #my_score = 2 - I win
      if $tries > 0
        $tries -= 1
        $my_score = 0
        $your_score = 0
        puts "You have one more try.\n"
      else
        puts "You lost! You are captured at sold as a coal mine worker. After a few months, "
        puts "you died from lung cancer because of the horrible conditions. "
        $passed = true
        $next_level = 'death'
      end
    elsif your_score > 1
      puts "You win! Here is the buffalo horns you need for the anecdote.\n"
      $passed = true
      $next_level = 'sudoku'
    end
  end
end
