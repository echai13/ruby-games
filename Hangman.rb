class Hangman 
  $word_bank = ["claustrophobic", "telecommunications", "xylophone",
                "chimpanzee", "jubilant"]
  $the_alphabet = "abcdefghijklmnopqrstuvwxyz"

  def enter()
    puts "You've escaped from being hang in Salem and the man who was saved gave you a "
    puts "magical amulet of Cleopatra as a reward, which is one of the ingredients in the "
    puts "anecdote. Now you've continued your journey to Centralia, Pennsylvania to find all "
    puts "the ingredients to the anecdote to your loved one's poison. Instead of testing "
    puts "your critical thinking, you will be tested on your intelligence.  If you "
    puts "lose, you will be thrown into the coal mine fire that caused this town to be "
    puts "deserted overnight."
    puts ""
    puts "Let's start!"

    solved = false
    count = 10
    index = rand(0..4)
    word_to_be_solved = $word_bank[index]
    unsolved_portion = ""

    #generate dashes in phrase to be solved
    (1..(word_to_be_solved.length)).each do |n|
      unsolved_portion += "-"
    end

    #while word is not solved aka solved is not true
    while !solved
      puts ""
      puts "Please input a letter. You have #{count} tries left."
      puts unsolved_portion #dashes

      #user inputs a letter
      letter_input = $stdin.gets.chomp

      if !$the_alphabet.include?(letter_input)
        puts "That's not a correct input. Please input a letter.\n"


      $the_alphabet.gsub(letter_input, "")

      #word has letter and letter hasn't been called yet
      elsif word_to_be_solved.include?(letter_input) && $the_alphabet.include?(letter_input)
        indices = []
        word_to_be_solved.length.times {|i| indices << i if word_to_be_solved[i,1] == letter_input}

        indices.each do |index|
          unsolved_portion[index] = letter_input
        end

        if !unsolved_portion.include?("-")
          solved = true
        end

      #letter has been called and it is in the word already
      elsif !$the_alphabet.include?(letter_input) && word_to_be_solved.include?(letter_input)
        puts "You've guessed that already, please guess another letter.\n"

      else
        if count == 0
          puts "You are out of tries. You will be hung next.\n"
          return 'death'
        else
          puts "That's incorrect. Try again!\n"
          count -= 1
        end
      end
    end
    return 'rockpaperscissors'
  end
end
