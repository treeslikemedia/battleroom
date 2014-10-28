class Question
  attr_reader   :type, :data
  attr_accessor :variable_name, :variable_value, :data_structure,
                :data_structure_class, :answer_value, :explanation,
                :evaluation_scope

  def initialize(evaluation_scope)
    @evaluation_scope = evaluation_scope
    @data = self.class.generate_question
    @variable_name = rotate_array(data[:possible_variable_names] || []).first
  end

  # retrieves question from front of the array and rotates it to the back
  # to avoid immediate re-sampling of questions
  def self.generate_question
    # calls upon *class instance* variable assigned in the subclasses
    question = @questions.shift
    @questions.push(question)
    question
  end

  def congratulation_sequence(duration)
    print_congratulation
    sleep duration
    clear_display
  end

  def handle_syntax_error_exceptions(error)
    if error.message.match /unexpected end-of-input/
      print_unexpected_end_of_input_explanation
    elsif error.message.include?('unterminated string meets end of file')
      puts 'Blurg! You neglected to provide closing quotes for your string. Try again!'.red
    end
  end

  def enter_evaluation_loop(&block)
    answered_correctly = false
    until answered_correctly
      begin
        user_input = Readline.readline('> '.blue, true)
        abort('Goodbye!'.green) if user_input.match(/^(q|exit|!!!\s?)\z/i)
        if !naughty_input?(user_input) && yield(user_input)
          congratulation_sequence(1.6)
          answered_correctly = true
        end
      rescue SyntaxError => e
        handle_syntax_error_exceptions(e)
      end
    end
  end

end # Question
