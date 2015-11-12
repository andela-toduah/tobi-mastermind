require 'single_game'
require 'logic'
require 'ui'

class MultiPlayer < SinglePlayer
  
  def start_game
    number = num_of_players
    end_guess = 12*number + 1
    
    puts UI::GENERATE_MESSAGE % [game_logic.sequence_type, game_logic.length, UI::COLOR_STRINGS[game_logic.level]]
    history_hash = {}
    guesses_hash = {}
    (1..number).each {|x| 
      history_hash[x] = []
      guesses_hash[x] = 0 
    }
    
    multi_start_game(number, history_hash, guesses_hash)    
  end  
  
  def multi_start_game(number, history_hash, guesses_hash)
    # allow the user guess up to twelve times before ending game
    total_guesses = 0
    catch :player_wins do
      while total_guesses < (UI::GUESS_MAX * number)
        for i in (1..number)
          last_guess = guesses_hash[i]
          print "---"
          print guesses_hash[i]
          print "----"
          print UI::PLAYER_MESSAGE % i
          while guesses_hash[i] == last_guess
            input = gets.chomp.downcase
            next if invalid_length(input)
            next if treat_option(input, history_hash[i])
            guesses_hash[i] = treat_guess(input, guesses_hash[i], history_hash[i])
            throw(:player_wins) if guesses_hash[i] == end_guess
          end
          puts ""
        end
      end
    end
    puts "Sorry, You all Lost." if total_guesses == UI::GUESS_MAX * number
  end
  
  def num_of_players
    print UI::MULTI_START_MESSAGE
    input = gets.chomp
    
    while (input.to_i == 0)
      print UI::INVALID_MESSAGE
      input = gets.chomp
    end
    
    return input.to_i
  end
  
end