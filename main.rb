require "csv"
require "time"
require "colorize"
require "tty-box"
require "tty-link"
require "tty-font"
require "securerandom"
require_relative "poems.rb"
require "fileutils"
gem "colorize"
gem "tty-box"
gem "tty-link"
gem "tty-font"
gem "pastel"

loop do
  #Generates one white line of space for style, generates large blue block text title
  puts "\n"
  font = TTY::Font.new(:starwars)
  pastel = Pastel.new
  puts pastel.blue(font.write("    MEMENTO   MORI      "))

  #puts HTML links
  def signature
    puts TTY::Link.link_to("Brought to you by Elon Musks Neuralink Monkey", " https://samsonblackburn.netlify.app/index.html")
  end

  #creates options menu
  #Generates a menubox using tty-box with predefined styles
  menubox = TTY::Box.info ("Options Menu:\n Generate Life Expectancy 'g'\n Delete your previous result 'i'\n See your previous saved data 'l'\n Play famous poems 't' \n Delete all data 'd' \n Exit Program 'x'\n")
  puts menubox

  #produces a random entry ID for user results reference in function 2
  entry_id = SecureRandom.random_number(1000)
  #SecureRandom.hex seemed like a more secure option
  #but I chose random_number instead so that the Markers did not have to enter a 16hexadecimal code just to trial functions

  #1 GENERATE LIFE EXPECTANCY 'g'
  #Asks user questions for calculation
  user_input = gets.chomp.downcase
  if user_input == "g"
    namehash = {}
    sleep_needed = 8
    avg_life_man = 80
    avg_life_woman = 85
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
    namehash[:anger] = anger
    puts "You answered #{anger}".colorize(:green)

    #Set constant variables and conditions for calculation
    if daily_sleep < sleep_needed
      avg_life_man = avg_life_man - 8
      avg_life_woman = avg_life_woman - 8
    else
      avg_life_man = avg_life_man + 6
      avg_life_woman = avg_life_woman + 6
    end
    if anger == "yes"
      avg_life_man = avg_life_man - 5
      avg_life_woman = avg_life_woman - 5
    elsif anger == "no"
      avg_life_man = avg_life_man + 5
      avg_life_woman = avg_life_woman + 5
    end

    #Calculation for Man entry and results output
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

      #Generate a loading box after generation to simulate load time for retro feeling
      calcboxsuccess = TTY::Box.success("Please standby...System calculating...")
      puts calcboxsuccess
      sleep 5
      puts "As a Man:"
      puts "You have roughly #{total_life_hours} hrs left to live."
      sleep 3
      puts "Uh oh #{name} #{total_life_hours_committed} hrs will be spent sleeping & working."
      sleep 2
      puts "So you've probably got #{total_life_hours_remaining} hrs left to spare at best."
      sleep 3
      puts "These results are being saved under your unique information id: #{entry_id}"
      puts "Do not lose this number. Without it, retrieval of past data is not possible."

      output_results_man = {}
      output_results_man[:total_life_yrs] = total_life_yrs
      output_results_man[:total_life_days] = total_life_days
      output_results_man[:total_life_hours_remaining] = total_life_hours_remaining
      #Generate the time of calculation and place inside container
      generated_time = {}
      generated_time[:current_time] = Time.now

      #Keep all the output values together and push to CSV in one block
      pusharrays_csv_man = entry_id, namehash.values, output_results_man.values, generated_time.values
      CSV.open("test.csv", "a+") do |row|
        row << pusharrays_csv_man
      end

      sleep 10
      #Call method using tty-link gem that generates HTML link
      puts signature

      #Calculation for Woman entry and results output
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

      #Generate a loading box after generation to simulate load time for retro feeling
      calcboxsuccess = TTY::Box.success("Please standby...System calculating...")
      puts calcboxsuccess
      sleep 5
      puts "As a Woman:"
      puts "You have roughly #{total_life_hours} hrs left to live."
      sleep 3
      puts "Uh oh #{name} #{total_life_hours_committed} hrs will be spent sleeping & working."
      sleep 2
      puts "So you've probably got #{total_life_hours_remaining} hrs left to spare at best."
      sleep 3
      puts "These results are being saved under your unique information id: #{entry_id}"
      puts "Do not lose this number. Without it, retrieval of past data is not possible."

      output_results_woman = {}
      output_results_woman[:total_life_yrs] = total_life_yrs
      output_results_woman[:total_life_days] = total_life_days
      output_results_woman[:total_life_hours_remaining] = total_life_hours_remaining
      generated_time = {}
      generated_time[:current_time] = Time.now

      pusharrays_csv_woman = entry_id, namehash.values, output_results_woman.values, generated_time.values
      CSV.open("test.csv", "a+") do |row|
        row << pusharrays_csv_woman
      end
      sleep 10
      puts signature
    end

    #2 DELETE PREVIOUS RESULT 'i'
  elsif user_input == "i"
    #Read in CSV ignore header values when indexing
    csv_new = CSV.read("test.csv", headers: true)
    #Read in CSV count header values when indexing
    csv_new_headers = CSV.read("test.csv", headers: false)
    puts "Please enter your entry ID to delete this specific result:"
    idlookup = gets.chomp
    #Deletes all previous data stored in copytest.csv
    delete_test_csv = FileUtils.rm Dir.glob("copytest.csv")
    #Creates a fresh copytest.csv
    CSV.open("copytest.csv", "a+") do
    end
    #Iterate over CSV and count output for accurate indexing
    counter = 0
    csv_new.each do |csv_new_row|
      temp_entry_id_row = csv_new_row[0]
      counter = counter + 1

      if idlookup == temp_entry_id_row
        counter_id = counter

        #Set counter2 to -1 because counter and counter2 produce different numbers due to headers in CSV.read
        counter2 = -1
        csv_new_headers.each do |csv_new_headers|
          counter2 = counter2 + 1
          if counter2 != counter_id
            #Push seed data from test.csv which does NOT contain row EntryID the user input
            CSV.open("copytest.csv", "a+") do |row|
              row << csv_new_headers
            end
          end
        end
        puts "Your entry has been deleted."
        sleep 3
      end
    end
    #3 SEE PREVIOUS SAVED DATA
  elsif user_input == "l"
    csv_new = CSV.read("test.csv", headers: true)
    csv_new_headers = CSV.read("test.csv", headers: false)
    puts "Please enter the entry_id of the previous Life Calculation data you want to see:"
    idlookup = gets.chomp
    counter = 0
    csv_new.each do |csv_new_row|
      temp_entry_id_row = csv_new_row[0]
      counter = counter + 1
      if idlookup == temp_entry_id_row
        counter_id = counter
        counter_id
        print csv_new_row
      end
    end

    #4 PLAY FAMOUS POEMS
  elsif user_input == "t"
    puts "Please type the number of poem you wish to play"
    puts "1: Sonder or 2: The Skeleton"
    input = gets.chomp.to_i
    if input == 1
      puts pastel.blue(font.write("    Sonder      "))
      sleep 5
      puts poem1
    elsif input == 2
      puts pastel.bright_green(font.write("    The skeleton     "))
      sleep 5
      puts poem2
    end

    #5 DELETE ALL USER DATA
  elsif user_input == "d"
    puts "If you wish to delete all user data please type: Yes"
    puts "Please be aware this is an irrecoverable action."
    confirmation = gets.chomp.downcase
    #Both SEED Data (test.csv) and amended data (copytest.csv) will be deleted permanently
    if confirmation == "yes"
      delete_test_csv = FileUtils.rm Dir.glob("copytest.csv")
      delete_test_csv = FileUtils.rm Dir.glob("test.csv")
      puts "All Data Deleted."
    end
  elsif user_input == "x"
    exit
  else
    puts "Please enter valid option"
  end
end
