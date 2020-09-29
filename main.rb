puts "Options"
puts "Generate life expectancy 'g'"
puts "improvement suggestions 'i'" 
puts "lookup old user data 'l'"
puts "exit program 'x'"

loop do
    user_input = gets.chomp
    if user_input == "g"
        #run generate life expectancy code
    sleep_needed = 8
    # age = gets.chomp.to_i
    # daily_sleep = gets.chomp.to_i
    # hours_worked = gets.chomp.to_i
    # anger = 1
    puts "Please enter your name."
    name = gets.chomp
    puts "thanks #{name}"
    puts "Are you a Man or Woman?"
    sex = gets.chomp
    puts "you chose #{sex}"

    elsif user_input == "i"

    elsif user_input == "l"

    elsif user_input == "x"
        exit
    else
        puts "Please enter valid option"

    end
end
