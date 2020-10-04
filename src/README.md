### Github Repository ###
### https://github.com/securetheb4g/MementoMori_a3.git ###

### R4	Provide a link to your source control repository ###	

### R5	Develop a statement of purpose and scope for your application. ### It must include:
</br>
<h4> Describe at a high level what the application will do: </h4>
</br>

<!-- ask user for age, health info, avg hours worked daily, avg sleep, then calculates average years left
Once you can do that, you want to be able to get your program to do it until you quit, that's a loop
Once you can do that, you want your app to save each estimate to a file, making persistent data
Once you can do that, each loop could be a new instance of a user class
Once you can do that, ask the user how this calculation makes them feel?
Once you can do that, put a quote about how precious time is and how it only belongs to you.
Once you can do that, offer suggestions on what can be improved based on the negative health metrics measured. 
So if smoking = true suggest 'Maybe you could try smoking less than 2 cigarettes per day?'
So if sleeping =< healthy sleep hours suggest 'Maybe you could sleep a little more?'
Once you can do that, store the results in a hash & create a persistent countdown the user can access via name. -->

Once the app opens the user will be shown a display menu. 
From the display menu the user can open a calculator for life expectancy. The life expectancy calculation is based on the average life span of male/female Australians and the average life span referenced reduces or increases throughout the application based on user indicated lifestyle choices. Once life expectancy is calculated, the user will be able to open 4 other options. One option allows the user to delete their specific result with their entry_id. The second option allows the user to lookup and print to screen their past results. The third option allows the user to run some timed poems. The Fourth option allows the user to delete all stored data in the app. The last option is to exit the program.


- identify the problem it will solve and explain why you are developing it

This app will roughly quantify how much time is left if the user lived to average age based on some contributing factors. Seneca said "It is not that we have a short time to live but that we waste alot of it."
The problem is most people don't actually consider their mortality ... spending too much time for others,
or for causes that don't give meaning to their lives.
If more of us in Western Democracies better utilised our time given modern conveniences, the world could improve at a rate far exceeding our wildest expectations.

- identify the target audience

ages 12 to 99

The ideal demographic are those of an age that can realistically comprehend their mortality. Young to elderly, who do not properly consider their time as a resource which will run out.

- explain how a member of the target audience will use it

The target audience will use this application to regain perspective on the number of hours left between their age and the average age of death in Australia.
To run the application, the user will download the folder files from Github, install the relevant gems and run the application with the provided bash script.

300 - 500 words
### R6	Develop a list of features that will be included in the application. ### 

1. Average Life Calculation
variables, loops, error handling, scope, hashes, method. 

The application gathers user input and stores these in variables for age, daily sleep, anger and sex. The average lifespan for Australians is used to calculate the life expectancy of the user as per the applications expected outcome. To do this the user input above is gathered and collected inside a hash which is then pushed into a CSV to be output as arrays. The application loops through each question. Once all questions have been given valid input a calculation is run on this set of data which provides the end output expected. Total life expectancy of user in hours remaining.

2. Delete your previous result
variables, loops, error handling, scope.

This feature allows the user to search for their previous life calculation with the entry ID generated in the life expectancy calculation.
Once the entry is found this allows the user to delete that particular entry from the data set.

3. See previous result using entry_id

variables, loops, error handling, scope, hashes, methods.

 This feature allows the user to search for their previous life calculation using the entry ID generated in the life expectancy calculation. 
 Once the entry is found the entire dataset is output to the screen for the user to see.

 4. Play famous poems

 This features allows the user to choose between two poems by requesting user input and executing the poem which aligns with the user input. Once executed the poem is output to the screen with colours and interesting generated text.

 5. Delete all user information

 This feature prompts the user with a warning, once YES is input by the user. Confirmation is assumed and all data stored in the entire application is deleted permanently.


### R7	Develop an outline of the user interaction and experience for the application. ###
Your outline must include:
- how the user will find out how to interact with / use each feature
The user is prompted with each step for user input. 
The user will require a keyboard to interact with each option as the program runs.
For the primary life calculation the user will input data used for the calculation, they are prompted on which data is needed throughout. At the end of the calculation the user is given an entry_id which they can use to interact with the other features in the application. 
The other features require the entry_id to see previous results and delete previous results. The last feature requires user input to delete all data within the application.


<h3>how errors will be handled by the application and displayed to the user</h3>	
The application will exit the current option menu and redisplay the original menu display.

### R8	Develop a diagram which describes the control flow of your application. ### 
Your diagram must:
- show the workflow/logic and/or integration of the features in your application for each feature.
- utilise a recognised format or set of conventions for a control flow diagram, such as UML.	
### R9	Develop an implementation plan which: ###
https://trello.com/b/GNTojast

### R10	Help Documentation. ### 

This application can be downloaded from GitHub (https://github.com/securetheb4g/MementoMori_a3) 

Once you have downloaded the github file, open the installation folder.

To run the file:
1. Open bash 
3. Install ruby on ubuntu the command is 'sudo apt install ruby-full'
2. Make sure you are in samsonblackburn_t1a3/src/
3. If not cd into samsonblackburn_t1a3/src/
4. run ./run_lifecalc.sh
5. If error 'command not found' or similar
6. run command "chmod +x run_lifecalc.sh"
	This will change computer permissions to allow .sh files to run unless
	you received an error due to lack of admin privileges.
7. once chmod +x permissions have been changed, run the run_lifecalc.sh file again to execute the program.

Step 4. above is an executable bash script that has been written toinstall the required gems and run the program for you. 

The gem dependencies on the app are as follows:
```
# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

gem "colorize", "~> 0.8.1"

gem "tty-box", "~> 0.6.0"

gem "tty-link", "~> 0.1.1"

gem "tty-font", "~> 0.5.0"

gem "pastel", "~> 0.8.0"
```

Ruby is required to run this program. 

Any system/hardware requirements -
OS -

   This application has only been tested on a Mac running Windows 10,
   which executes Ubuntu 20.04 LTS and VSCode WSL: Ubuntu 20.04.
   It may not work on your operating system without troubleshooting.

### R11 TEST INFORMATION ###
<br><br><br>
Test 1:  Function:  Is the user able to complete the life expectancy calculation? And will this information be correctly written to the CSV?  </br><br>
Process: Manual Test: Completed all user input requirements, checked CSV file to ensure data is being written.</br><br> Outcome: All data is being input and written to the CSV correctly. Although the CSV information could be formatted better and the input CSV data could be improved on in terms of data structures utilised.
<br><br><br><br>
Test 2.: Function: Is the user able to find their data using the entry_id generated? And will the data be deleted as per function? <br> Process: Manual Test: Entered in a pre-generated entry_id, output claims success. <br>Outcome: The data was successfully iterated through in the csv, the entry_id was linked with the correct row and the expected entry was deleted as per function requirements.
<br><br><br><br>
Test 3: Function: Is the user able to find their data using the entry_id generated? And can the data linked to the entry_id be correctly output to the users screen? <br><br>Process: Manual Test: Entered in a pre-generated entry_id, output information stored in CSV. <br>Outcome: The specific row of data stored in the CSV and linked to the entry_id was successfully output to the screen.
<br><br><br><br>
Test 4: Function: Is the user able to delete all stored data in both CSV’s? <br><br>Process: Manual Test: Responded to the output warning text “YES” program executed function and returned to main home menu. <br>Outcome: All data inside the CSV’s was successfully deleted permanently. Needed to reseed the data again for teachers ease of use.
