require "csv"


loop do
    puts "Options"
    puts "Generate life expectancy 'g'"
    puts "improvement suggestions 'i'" 
    puts "lookup old user data 'l'"
    puts "exit program 'x'"
    user_input = gets.chomp
    if user_input == "g"
        namehash = {}  
        #run generate life expectancy code
        sleep_needed = 8
        avg_life_man = 80
        avg_life_woman = 85
        # age = gets.chomp.to_i
        # anger = 1
        puts "Please enter your name."
        name = gets.chomp.capitalize
        namehash[:name] = name
        puts "thanks #{name}"
        puts "Are you a Man or Woman?"
        sex = gets.chomp.capitalize
        namehash[:sex] = sex
        puts "you chose #{sex}"
        puts "What's your age?"
        age = gets.chomp.to_i
        namehash[:age] = age
        puts "your input age was #{age}"
        puts "Please enter the number of hours you sleep roughly:"
        daily_sleep = gets.chomp.to_i
        namehash[:daily_sleep] = daily_sleep
        puts "You said you sleep about #{daily_sleep}hrs per day."
        puts "Please enter the number of hours you work each day roughly:"
        hours_worked = gets.chomp.to_i
        namehash[:hours_worked] = hours_worked
        puts "You said you work about #{hours_worked}hrs per day"
        puts "Are you quick to anger? Please type yes or no"
        anger = gets.chomp.downcase
        namehash[:anger] = anger
        puts "You answered #{anger}"

        CSV.open('test.csv', 'a+') do |row|
            row << namehash.values
        end


        if daily_sleep < sleep_needed
            avg_life_man = avg_life_man -8
            avg_life_woman = avg_life_woman -8
            # puts "#{avg_life_man} #{avg_life_woman}"
        else
            avg_life_man = avg_life_man +6
            avg_life_woman = avg_life_woman +6
        end
        if anger == "yes"
            avg_life_man = avg_life_man -5
            avg_life_woman = avg_life_woman -5
            # puts "#{avg_life_man} #{avg_life_woman}"
        elsif anger == "no"
            avg_life_man = avg_life_man +5
            avg_life_woman = avg_life_woman +5
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
        puts "
        Congratulations based on the information you gave, which considers that you are a Man.
        You have roughly #{total_life_hours} hrs left to live. 
        Of those you indicated #{total_life_hours_committed} hrs will be spent sleeping & working. 
        This leaves #{total_life_hours_remaining} hrs left of uncommitted time. Crazy huh?
        "

        output_results_man = {}
        output_results_man[:total_life_yrs] = total_life_yrs
        output_results_man[:total_life_days] = total_life_days
        output_results_man[:total_life_hours_remaining] = total_life_hours_remaining

        CSV.open('test.csv', 'a+') do |row|
            row << output_results_man.values
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
        puts "
        Congratulations based on the information you gave, which considers that Women live longer.
        You have roughly #{total_life_hours} hrs left to live. 
        Of those you indicated #{total_life_hours_committed} hrs will be spent sleeping & working. 
        This leaves #{total_life_hours_remaining} hrs left of uncommitted time. Crazy huh?
        "
        output_results_woman = {}
        output_results_woman[:total_life_yrs] = total_life_yrs
        output_results_woman[:total_life_days] = total_life_days
        output_results_woman[:total_life_hours_remaining] = total_life_hours_remaining

        CSV.open('test.csv', 'a+') do |row|
            row << output_results_woman.values
        end
    end

    elsif user_input == "i"
        user_input = gets.chomp.capitalize
        csv = CSV.read('test.csv', headers: true, converters: :all)
        csv_new = csv.find { |csv_values| user_input == csv_values["name"]}
        # csv.each {|csv_values| p csv_values}
        puts "Enter which previous data you would like to change:"
        data_to_change = gets.chomp
        puts "What would you like to change it to?"
        newdata = gets.chomp
    elsif user_input == "l"

    elsif user_input == "x"
        exit
    else
        puts "Please enter valid option"

    end
end
