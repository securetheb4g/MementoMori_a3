require "csv"
require "time"
require "colorize"
require "tty-box"
require "tty-link"
require_relative "poems.rb"
gem "colorize"
gem "tty-box"
gem "tty-link"

loop do
  puts "\n"

  #puts HTML links
  def signature
    puts TTY::Link.link_to("Brought to you by Elon Musks Neuralink Monkey", " https://samsonblackburn.netlify.app/index.html")
  end
  #creates options menu
  menubox = TTY::Box.info ("Options Menu:\n Generate Life Expectancy 'g'\n Improvement Suggestions 'i'\n Run a poem about Time 'l'\n Exit Program 'x'\n")
  puts menubox
  #produces a random entry ID for user reference
  def entry_id
    entry_id = rand(1..1000)
    p entry_id
  end

  # puts "Options".colorize(:white)
  # puts "Generate life expectancy 'g'".colorize(:green)
  # puts "improvement suggestions 'i'".colorize(:light_blue)
  # puts "lookup old user data 'l'".colorize(:red)
  # puts "exit program 'x'".colorize(:white)
  user_input = gets.chomp
  if user_input == "g"
    namehash = {}
    #run generate life expectancy code
    sleep_needed = 8
    avg_life_man = 80
    avg_life_woman = 85
    # age = gets.chomp.to_i
    # anger = 1
    puts "Please enter your name.".colorize(:white)
    name = gets.chomp.capitalize
    namehash[:name] = name
    puts "thanks #{name}".colorize(:green)
    puts "Are you a Man or Woman?".colorize(:white)
    sex = gets.chomp.capitalize
    namehash[:sex] = sex
    puts "you chose #{sex}".colorize(:green)
    puts "What's your age?".colorize(:white)
    age = gets.chomp.to_i
    namehash[:age] = age
    puts "your input age was #{age}".colorize(:green)
    puts "Please enter the number of hours you sleep roughly:".colorize(:white)
    daily_sleep = gets.chomp.to_i
    namehash[:daily_sleep] = daily_sleep
    puts "You said you sleep about #{daily_sleep}hrs per day.".colorize(:green)
    puts "Please enter the number of hours you work each day roughly:".colorize(:white)
    hours_worked = gets.chomp.to_i
    namehash[:hours_worked] = hours_worked
    puts "You said you work about #{hours_worked}hrs per day".colorize(:green)
    puts "Are you quick to anger? Please type yes or no".colorize(:white)
    anger = gets.chomp.downcase
    namehash [:anger] = anger
    puts "You answered #{anger}".colorize(:green)

    # CSV.open("test.csv", "a+") do |row|
    #   row << namehash.values
    # end

    if daily_sleep < sleep_needed
      avg_life_man = avg_life_man - 8
      avg_life_woman = avg_life_woman - 8
      # puts "#{avg_life_man} #{avg_life_woman}"
    else
      avg_life_man = avg_life_man + 6
      avg_life_woman = avg_life_woman + 6
    end
    if anger == "yes"
      avg_life_man = avg_life_man - 5
      avg_life_woman = avg_life_woman - 5
      # puts "#{avg_life_man} #{avg_life_woman}"
    elsif anger == "no"
      avg_life_man = avg_life_man + 5
      avg_life_woman = avg_life_woman + 5
      # puts "#{avg_life_man} #{avg_life_woman}"
    end

    if sex == "Man"
      hours_in_day = 24
      hrs_spent_p_day = hours_in_day - hours_worked - daily_sleep
      hrs_remaining = 24 - hrs_spent_p_day
      hrs_pyr_available = hrs_remaining * 365
      total_life_yrs = avg_life_man - age
      total_life_days = total_life_yrs * 365
      total_life_hours = total_life_days * 24
      total_life_hours_committed = hrs_pyr_available * total_life_yrs
      total_life_hours_remaining = total_life_hours - total_life_hours_committed
      calcboxsuccess = TTY::Box.success("Please standby...System calculating...")
      puts calcboxsuccess
      sleep 5
      puts"As a Man:"
      puts"You have roughly #{total_life_hours} hrs left to live."
      sleep 3
      puts "Uh oh #{name} #{total_life_hours_committed} hrs will be spent sleeping & working." 
      sleep 2
      puts "So you've probably got #{total_life_hours_remaining} hrs left to spare at best." 
    sleep 10
    puts signature

      output_results_man = {}
      output_results_man[:total_life_yrs] = total_life_yrs
      output_results_man[:total_life_days] = total_life_days
      output_results_man[:total_life_hours_remaining] = total_life_hours_remaining
      generated_time = {}
      generated_time[:current_time] = Time.now
    #   CSV.open("test.csv", "a+") do |row|
    #     row << output_results_man.values
    #   end
    pusharrays_csv_man = namehash.values, output_results_man.values, generated_time.values 
      CSV.open("test.csv", "a+") do |row|
        row << pusharrays_csv_man
      end
    elsif sex == "Woman"
      hours_in_day = 24
      hrs_spent_p_day = hours_in_day - hours_worked - daily_sleep
      hrs_remaining = 24 - hrs_spent_p_day
      hrs_pyr_available = hrs_remaining * 365
      total_life_yrs = avg_life_woman - age
      total_life_days = total_life_yrs * 365
      total_life_hours = total_life_days * 24
      total_life_hours_committed = hrs_pyr_available * total_life_yrs
      total_life_hours_remaining = total_life_hours - total_life_hours_committed
      calcboxsuccess = TTY::Box.success("Please standby...System calculating...")
      puts calcboxsuccess
      sleep 5
      puts"As a Woman:"
      puts"You have roughly #{total_life_hours} hrs left to live."
      sleep 3
      puts "Uh oh #{name} #{total_life_hours_committed} hrs will be spent sleeping & working." 
      sleep 2
      puts "So you've probably got #{total_life_hours_remaining} hrs left to spare at best." 
    sleep 5
    puts signature
    sleep 5

      output_results_woman = {}
      output_results_woman[:total_life_yrs] = total_life_yrs
      output_results_woman[:total_life_days] = total_life_days
      output_results_woman[:total_life_hours_remaining] = total_life_hours_remaining
      generated_time = {}
      generated_time[:current_time] = Time.now

    #   CSV.open("test.csv", "a+") do |row|
    #     row << output_results_woman.values
    #   end
    #   CSV.open("test.csv", "a+") do |row|
    #     row << generated_time.values
    #   end
    pusharrays_csv_woman = namehash.values, output_results_woman.values, generated_time.values 
    CSV.open("test.csv", "a+") do |row|
      row << pusharrays_csv_woman
    end
    end
  elsif user_input == "i"
    # puts "Please enter the first name of the Life Calculation you want to read:"
    # csv = CSV.read('test.csv', headers: true, converters: :all)
    # # countrow = 0
    # countcolumn = 0
    #CSV[0] gives the first row, .each makes a = [header, csv[0][count]] where count = for loop iteration
    # p csv[x][p]
    # p csv[3][2]
    # tmpohy = ["21535", "dsfuah", "juajfd"]
    # p csv[0]
    # p csv[][].index { |element| element == "21535" }
    # csv[1].each_with_index do |a|
    #     # p countcolumn 
    #     if a[1] == "Terry"
    #         csv[1][countcolumn] = "hi" 
    #         countcolumn = countcolumn +1 
    #         p csv[1][countcolumn]
    #         p "true"
    #     else 
    #         p "false" 
    #         # p "hello" + countcolumn.to_s
    #         countcolumn = countcolumn + 1 
    #     end
    # end
    # p csv[0]
    # table = CSV.parse(File.read("test.csv"), headers: true)
    # # csv_new = csv.find { |csv_values| user_input == csv_values["name"]}
    # # csv.each {|csv_values| p csv_values}
    # # table.methods
    # user_input = gets.chomp.capitalize
    # if user_input
    #     puts "hi"
    # else
    #     puts "fuck"
    # end
    

    # fin = Time.now + 10; while Time.now < fin; puts fin - Time.now; sleep 1; system "play -n synth 0.1 square 1228" end

    # puts "What would you like to change it to?"
    # newdata = gets.chomp
  elsif user_input == "l"
    puts poem1
  elsif user_input == "x"
    exit
  else
    puts "Please enter valid option"
  end
end
