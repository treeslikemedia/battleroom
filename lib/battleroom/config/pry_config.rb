# eliminates deprecation warning
I18n.config.enforce_available_locales = false

def configure_pry
  Pry.config.default_window_size = 0
  Pry.config.quiet = true
  Pry.prompt = [proc { "> ".blue }, proc { "* ".blue }]
  Pry.config.memory_size = 10

  Pry::Commands.delete("exit")

  # Pry::Hooks.new.clear_all

  Pry.config.hooks.add_hook :before_eval, :self_terminate do |last_input, pry_instance|
    $input = last_input
    puts ''
    unless last_input.include?("revert_pry_to_defaults")
      pry_instance.run_command("continue")
    end
  end

end

configure_pry
