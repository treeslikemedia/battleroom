require_relative 'question_data/variable_assignment'
require_relative 'question_data/data_structure_access'
require 'pry'
require 'colorize'
require 'readline'

# include Readline

module BattleroomMachinery
  class Question
    attr_reader :type, :data
    attr_accessor :variable_name, :variable_value, :value_type

    def initialize(options = {}, type)
      @data = options
      @type = type
      format!
    end

    def format!
      case self.type
      when :variable
        self.variable_name = data[:possible_variable_names].sample
        self.variable_value = data[:possible_variable_values].sample
        self.value_type = data[:value_type]
      when :data_structure_access
        if data_structure.class == Array
          # randomizes and shuffles the items in the arrays, so repeats remain interesting
          question_clone[:data_structure] = question_clone[:data_structure].shuffle[0,3]
          question_clone[:answer_value] = question_clone[:data_structure].sample
          question_clone[:hint] = "index values start at 0."
          question_clone[:class] = "Array"
        else
          question_clone[:answer_value] = data_structure[data_structure.keys.sample]
          question_clone[:hint] = "you have to use the EXACT hash key to retrieve the associated value."
          question_clone[:class] = "Hash"
        end
      end
    end

    def provide_variable_prompt
      puts "Create a variable, #{self.variable_name}, and assign it the #{self.value_type} value #{self.variable_value}".blue
    end

    def evaluate_variable_assignment(evaluation_scope)
      answered_correctly = false
      until answered_correctly
        answer = Readline.readline("> ", true)
        abort("Goodbye!".green) if answer.match /^exit\s?/i
        begin
          evaluation_scope.eval(answer)
          if evaluation_scope.eval("#{self.variable_name} == #{self.variable_value}")
            print_congratulation
            answered_correctly = true
          else
            print "You mis-assigned #{self.variable_name}. ".red + "Try Again!\n".green
          end
        rescue NameError
          puts "Looks like you mistyped the variable name. Check for misspellings and try again.".red
        rescue Exception => e
          puts e.message
        end
      end
    end # evaluate_variable_assignment

  end

  def clear_display
    `reset`
  end

  def print_menu_options
    puts "What would you like to work on?".blue
    puts "1. Variable assignment"
    puts "2. Accessing values from arrays/hashes"
    puts "Q. Quit\r\n\n"
  end

  def random_congratulation
    ["Lovely work, my friend!\n", "Beautiful!\n", "Lovely!\n", "Splendid!\n", "Nice job! Keep it rolling!\n", "Capital work, battlestar!\n", "You're on your way!\n", "Exemplary work!\n", "Yeah!\n", "Roll on.\n", "You're making a prosperous go of this programming thing.\n", "Bullseye!\n"].sample
  end

  def print_congratulation
    puts random_congratulation.green
  end


  def print_colorized_name_error_prompt
    puts "You're referencing a variable that doesn't exist, probably as the result of a mispelling. This results in a common error that says: \n\n".red
    puts "\tundefined local variable or method \'WHATEVER_YOU_MISTYPED\'\n".green
    puts "Get used to it and try again.".red
  end

  def format_question_hash_based_on_data_structure_class(randomly_assigned_question)
    # clone data structure for question_specific data_structure
    question_clone = randomly_assigned_question.clone
    data_structure = question_clone[:data_structure]
    if data_structure.class == Array
      # randomizes and shuffles the items in the arrays, so repeats remain interesting
      question_clone[:data_structure] = question_clone[:data_structure].shuffle[0,3]
      question_clone[:answer_value] = question_clone[:data_structure].sample
      question_clone[:hint] = "index values start at 0."
      question_clone[:class] = "Array"
    else
      question_clone[:answer_value] = data_structure[data_structure.keys.sample]
      question_clone[:hint] = "you have to use the EXACT hash key to retrieve the associated value."
      question_clone[:class] = "Hash"
    end
    question_clone
  end

  def print_data_structure_access_prompt(given_question)
    # question_hash = DATA_STRUCTURE_QUESTIONS.sample
    # question_hash = format_question_hash_based_on_data_structure_class(question_hash)
    answer_value_class = given_question[:answer_value].class.to_s
    answer_value_class = "Boolean" if answer_value_class.match /(TrueClass|FalseClass)/
    answer_value_string = answer_value_class == "String" ? "'#{given_question[:answer_value]}'" : given_question[:answer_value].to_s
    puts "Given the data structure below, how would you access the #{answer_value_class} value, ".blue + "#{answer_value_string}".yellow + " ?".blue
    puts "#{given_question[:variable_name]} = #{given_question[:data_structure].to_s}".green
  end

  def evaluate_data_structure_access_response(evaluation_scope, question_hash)
    # question_hash = DATA_STRUCTURE_QUESTIONS.sample
    # question_hash = format_question_hash_based_on_data_structure_class(question_hash)
    # provides the scope necessary for answer eval later on
    evaluation_scope.eval("#{question_hash[:variable_name]} = #{question_hash[:data_structure].to_s}")
    # print_data_structure_access_prompt(question_hash)
    answered_correctly = false
    until answered_correctly
      input = Readline.readline(">", true)
      break if input === /^exit\s?/i
      begin
        if evaluation_scope.eval(input) == question_hash[:answer_value]
          print_congratulation
          answered_correctly = true
          sleep 1.5
          clear_display
        else
          puts "Remember, #{question_hash[:hint]} Try again.".red
        end
      rescue NameError
        print_colorized_name_error_prompt
      end
    end
  end

end
