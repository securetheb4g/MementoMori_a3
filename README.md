### Github Repository ###
### https://github.com/securetheb4g/MementoMori_a3.git ###

### R4	Provide a link to your source control repository ###	
Design a Software Development Plan for a terminal application. The following requirements provide details of what needs to be included in this plan,	
### R5	Develop a statement of purpose and scope for your application. ### It must include:
- describe at a high level what the application will do

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
From the display menu the user can open a calculator for life expectancy. The life expectancy calculation is based on the average life span of male/female Australians and the average life span referenced reduces or increases throughout the application based on user indicated lifestyle choices. Once life expectancy is calculated, the user will be able to open two new options. One option lists suggestions for improvement of their unique life expectancy results based on the results saved from the first calculation. The second option allows the user to lookup their past results and recalculates their remaining life expectancy based on a calculation of the initial results given by the life expectancy app and a new date indicated by the user.


- identify the problem it will solve and explain why you are developing it

This app will roughly quantify how much time is left if the user lived to average age based on some contributing factors. Seneca said "It is not that we have a short time to live but that we waste alot of it."
The problem is most people don't actually consider their mortality ... spending too much time for others,
or for causes that don't give meaning to their lives.
If more of us in Western Democracies better utilised our time given modern conveniences, the world could improve at a rate far exceeding expectations.

- identify the target audience

ages 18 to 99

The ideal demographic includes those who need a reminder that their hours are numbered or otherwise those that have not properly considered that their life will end one day.

- explain how a member of the target audience will use it

The user will run the exe, answers the questions and consider the results.

300 - 500 words
### R6	Develop a list of features that will be included in the application. ### 
It must include:
- at least THREE features

- describe each feature

1. Average Life Calculation
variables, loops, error handling, scope, hashes, methods, classes. 

The application gathers user input and stores these in variables for age, daily sleep, anger and sex. The average lifespan for Australians is used to calculate the life expectancy of the user as per the applications expected outcome. To do this the user input above is gathered and collected inside a hash of arrays. The application loops through each question, checking for valid input until progressing to the next question. Once all questions have been given valid input a calculation is run on this set of data which provides the end output expected. Total life expectancy of user in hours remaining.

2. Suggestions for improvement on life expectancy
variables, loops, error handling, scope.

Based on the information gathered in option 1. Life Expectancy calculator, the user is able to view a range of suggestions which produce custom responses based on what the user needs to improve to increase life expectancy. To do this, the user inputs a name, which is validated based on previous results generated in the calculator. If the name input matches a previous calculation generated, the option outputs custom improvement suggestions.

3. Store the results and lookup later.

variables, loops, error handling, scope, hashes, methods, classes. 

The user input generated in the life expectancy calculation is stored and retrieved for option 3 "Data lookup". In option 3 the user is able to input their name, which is validated upon past input results. Once name is validated the user is asked what the current date is. With this information a calculation is done that takes the date the previous life expectancy calculation was generated and a user input date subtracting the hours since generation. With this figure the user can see a consistent countdown of hours remaining from initial calculation. 

Note: Ensure that your features above allow you to demonstrate your understanding of the following language elements and concepts:
- use of variables and the concept of variable scope
- loops and conditional control structures
- error handling

Consult with your educator to check your features are sufficient .	300 words (approx. 100 words per feature)
### R7	Develop an outline of the user interaction and experience for the application. ###
Your outline must include:
- how the user will find out how to interact with / use each feature
help menu?

- how the user will interact with / use each feature
typing into the keyboard?

- how errors will be handled by the application and displayed to the user	
humourous messages to the screen

### R8	Develop a diagram which describes the control flow of your application. ### 
Your diagram must:
- show the workflow/logic and/or integration of the features in your application for each feature.
- utilise a recognised format or set of conventions for a control flow diagram, such as UML.	
### R9	Develop an implementation plan which: ###
- outlines how each feature will be implemented and a checklist of tasks for each feature
- prioritise the implementation of different features, or checklist items within a feature
- provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

Utilise a suitable project management platform to track this implementation plan

> Your checklists for each feature should have at least 5 items.