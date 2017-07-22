class Riddles 
  $riddle_bank_A = ["What can travel around the world while staying in a corner?",
                  "What gets wetter and wetter the more it dries?"]

  $riddle_bank_B = ["Which word in the dictionary is spelled incorrectly?",
                  "The more you take, the more you leave behind, what am I?"]

  $riddle_bank_C = ["Feed me and I will live, yet give me a drink and I die, what am I?",
                  "What gets broken without being held?"]

  $answers = ["stamp", "towel", "incorrectly", "footsteps", "fire", "silence"]
  $round = 1
  $choose_set = rand(0..3)

  def enter()
    puts "You've entered the town of Salem."
    puts "As a guest, you are invited to determine the "
    puts "fate of a suspected mafia. The town will hang the man "
    puts "if you can't guess the answer before you used up all "
    puts "your tries. If the man is killed, you will be next..."
    puts ""


    tries = 5
    correct = false
    while !correct || tries > 0
      get_riddles()
      print "What is your answer? "
      input = $stdin.gets.chomp
      correct = check_answer(input)

      if correct && $round != 2
        correct = false
        puts "Last round!"
        puts ""
        $round += 1
      end

      if $round == 2 && correct
        tries = -1
      end
    end
    return 'hangman'
  end

  def check_answer(answer)
    if $round == 1
      if $answers[$choose_set*2] == answer

        return true
      end
    else
      if $answers[2*$choose_set + 1] == answer
        return true
      end
    end
    return false
  end

  def get_riddles()
    if $round == 1
      if $choose_set == 0
        puts $riddle_bank_A[0]
      elsif $choose_set == 1
        puts $riddle_bank_B[0]
      else
        puts $riddle_bank_C[0]
      end
    else
      if $choose_set == 0
        puts $riddle_bank_A[1]
      elsif $choose_set == 1
        puts $riddle_bank_B[1]
      else
        puts $riddle_bank_C[1]
      end
    end
  end
end
