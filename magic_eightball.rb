
# Use the colorize gem (from lecture) to add some color to your application.
# Ability to reset answers back to the original bank (hint: think arr.clone)
# Via easter egg question ("reset_answers")
 
require "pry"
require 'colorize'

class EightBall

  def initialize
    @comp_answers =[ 
      "It is certain.",
      "It is decidedly so.",
      "Without a doubt.", 
      "Yes - definitely",
      "You may rely on it.",
      "As I see it, yes.",
      "Most likely.",
      "Outlook good.",
      "Yes.",
      "Signs point to yes.",
      "Reply hazy, try again.",
      "Ask again later.",
      "Better not tell you now.",
      "Cannot predict now.",
      "Concentrate and ask again.",
      "Don't count on it.",
      "My reply is no.",
      "My sources say no.",
      "Outlook not so good.",
      "Very doubtful.",
    ]

    @user_answers =[]
    main_menu
  end

  def main_menu
    puts "Hello! Welcome to the Magic 8 Ball.".colorize(:pink)
    puts "Please select one of the options below:".cyan
    puts "1) Ask your question.".blue
    sleep(1)
    puts "2) Exit.".blue

    input = gets.to_i

    case input
      when 1
        print `clear`
        puts "Enter your random question here?".cyan
        input = gets
        random_answer
        
      
      when 2
        puts "See you next time.".yellow
      else
        puts "Invalid input, try again.".red
    end
  end

  def random_answer
    print " >"
    puts @comp_answers.sample(1)
    puts "Do you want to write your own answer? (Y/N)?".cyan
    input = gets.strip
    case input
      when "Y"
        add_answer
      when "N"
        puts "See you next time!".yellow
      else
        puts "Invalid input!".red
    end

  end


  def add_answer
    @match = false
    puts "Write what you want to hear.".cyan
    inputanswer = gets.strip
    @comp_answers.each_with_index do |answer, i|
      if inputanswer == @comp_answers[i]
        @match = true
      end
    end
    
    if @match == true
      puts "#{inputanswer} can't be used. Try again".red
    elsif @match == false
      puts "'#{inputanswer}' has been added.".blue
      @user_answers << inputanswer.to_s
    

    end
   
    menu_answers 
  end

  def menu_answers
    puts "Choose what you want to do next.".cyan
    puts "1) Add more answers.".blue
    puts "2) View all answers.".blue
    puts "3) Delete all of your own answers.".blue
    puts "4) Exit".red
  
    inputmore = gets.strip.to_i
    case inputmore
      when 1
        add_answer
      when 2
        puts "#{@comp_answers.join(', ')}, #{@user_answers.join(', ')}"
        menu_answers
      when 3
        puts "#{@user_answers.join(', ')} has been deleted.".red
        @user_answers.clear
        menu_answers
      when 4
        puts "See you next time.".yellow
      else
        puts "Invalid input".red
        menu_answers

    end
  end


 

end
EightBall.new