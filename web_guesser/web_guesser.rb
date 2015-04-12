require 'sinatra'
#require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  number = SECRET_NUMBER
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => number, :message => message}
end

def check_guess(guess)
  # Colorizing the Output
  #
  # Can you make it so they only get five guesses before a new number is
  # generated? 
  #
  # Create a class variable with @@ that keeps track of how many guesses they
  # have remaining
  # When subtract one from that each guess
  # If the guesses reach zero, then…
  # Generate a new number
  # Set the number of guesses back to five
  # Show them a message that they’ve lost and a new number has been generated
  # If they guess correctly, then…
  # Generate a new number
  # Set the number of guesses back to five
  # Show the message that they’ve guessed correctly
  #
  # http://localhost:4567/?guess=56&cheat=true
  # They unlock the cheat mode. When cheat is true, the page should always print
  # out the secret number so they can get it right on the next guess.
  #
  if guess.to_f == SECRET_NUMBER
    "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
  elsif guess.to_f > (SECRET_NUMBER - 5) && guess.to_f < (SECRET_NUMBER + 5)
    guess.to_f < SECRET_NUMBER ? "Too low!" : "Too high!"
  elsif guess.to_f < SECRET_NUMBER
    "Way too low!"
  elsif guess.to_f > SECRET_NUMBER
    "Way too high!"
  else
    "Something went wrong."
  end
end
