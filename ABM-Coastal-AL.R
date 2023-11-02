################################################################################
#                                                                              #
# Alabama Coastal Tourism Agent-Based Model                                    #
#                                                                              #
################################################################################

setwd()

# Load required packages
library(dplyr)

# Load your demographic data from a CSV file (replace 'your_data.csv' with the actual file name)
datum <- read.csv(file.choose())

#Remove NA so the proportions make sense
datum <- na.omit(datum)



#-------------------------------------------------------------------------------

# Calculate demographic proportions
race_proportions <- datum %>%
  group_by(Race) %>%
  summarize(count = n()) %>%
  mutate(proportion = count / sum(count))

gender_proportions <- datum %>%
  group_by(Gender) %>%
  summarize(count = n()) %>%
  mutate(proportion = count / sum(count))

education_proportions <- datum %>%
  group_by(Education) %>%
  summarize(count = n()) %>%
  mutate(proportion = count / sum(count))
         
         # Define the number of agents and simulation steps
         num_agents <- 100 #This is how large the population is, and can be changed later on
         num_steps <- 50 #How many times will agents interact with wildlife. 
         
         #Individual based - each "agent" is a person in a coastal population
         #  - each person/agent has properties
         #  - parameters and attributes
         #  - Agents/individuals to have behaviors based on those parameters
         
         # Create a data frame to represent agents
         agents <- data.frame(
           agent_id = 1:num_agents,
           race = sample(race_proportions$Race, num_agents, replace = TRUE, prob = race_proportions$proportion),#Assign race
           gender = sample(gender_proportions$Gender, num_agents, replace = TRUE, prob = gender_proportions$proportion), #Assign gender
           education = sample(education_proportions$Education, num_agents, replace = TRUE, prob = education_proportions$proportion), #Assign education
           policy_knowledge = rep(0, num_agents),  # Initialize policy knowledge to zero
           education_material = sample(c("sign", "pamphlet", "sticker", "magnet"), num_agents, replace = TRUE)
         )
         
         # Define a function to model agent-education interactions
         interact_with_education <- function(agent, step) {
           # Simulate agent-education interactions
           education_material <- agent$education_material
           # You can implement specific behaviors for each material here
           if (education_material == "sign") {
             # Interaction with sign
             # Update agent's knowledge based on the interaction
             agent$policy_knowledge <- agent$policy_knowledge + 1
           } else if (education_material == "pamphlet") {
             # Interaction with pamphlet
             # Update agent's knowledge based on the interaction
             agent$policy_knowledge <- agent$policy_knowledge + 2
           } else if (education_material == "sticker") {
             # Interaction with sticker
             # Update agent's knowledge based on the interaction
             agent$policy_knowledge <- agent$policy_knowledge + 3
           } else if (education_material == "magnet") {
             # Interaction with magnet
             # Update agent's knowledge based on the interaction
             agent$policy_knowledge <- agent$policy_knowledge + 4
           }
           return(agent)
         }
         
         # Define a function to model agent-wildlife interactions
         interact_with_wildlife <- function(agent, step) {
           # Simulate agent-wildlife interactions based on policy knowledge
           if (agent$policy_knowledge == 1) {
             # Positive interaction with wildlife
             # You can implement specific behaviors here
             agent$wildlife_interaction <- rnorm(1, mean = 5, sd = 2)
           } else {
             # Negative interaction with wildlife
             # You can implement different behaviors here
             agent$wildlife_interaction <- rnorm(1, mean = 2, sd = 1)
           }
           return(agent)
         }
         
         # Run the simulation
         for (step in 1:num_steps) {
           for (i in 1:num_agents) {
             # Interact with education material
             agents[i, ] <- interact_with_education(agents[i, ], step)
             # Interact with wildlife
             agents[i, ] <- interact_with_wildlife(agents[i, ], step)
           }
         }
         
         # Explore the resulting data
         summary(agents$wildlife_interaction)
         
         # Visualize and analyze the data using ggplot2, dplyr, or other libraries.
         

#-------------------------------------------------------------------------------

#Parameterization: selecting values for model parameters
  #This is where you try to "break" your model - make sure it is following all of the rules
    #For our model, maybe we ensure they interact with a dolphin at least one time?

#Calibration: type of parameterization where we vary one parameter and compare
#model output to real system (via pattern matching)
    #Calibration happens when the whole model is running
        #Goals
          #1. Make sure the model behaves like a real system
          #2. Estimate values of parameters where we have no good estimates
          #3. Test how realistic the model is

        #Approach
          #Run the model many time using different parameter values. Then analyze the outputs
          #to determine which value caused model to produce expected patterns

          #Be sure that known values are comparable to model outcomes
              #This is when we compare our survey data results with the model output

#-------------------------------------------------------------------------------
#Output
         
#Here we will record the results of the iteration


#My models runs! But now what?
    #Does the output match the known data you have for your system (this would be our survey results)
    #Which parameters are the strongest influences on how my model performs

#Model currencies

    #Summary statistics or observation that often correspond to what you'd measyre in an experiment,
    #if the experiment you are modelling was feasible

    #It can be really helpful to have more than one current because e this is a natural 
    #place to compare discuss model outputs

#Types to consider
    #patterns you outlines in ODD purpose statements
    #Standard measurement of statistical distribution of your results: mean, median, standard deviation, etc.
    #Differences among agents: genetic variability, age, education level, sex
    #Things that characterize model stability: population size

#Initial model experiments
    #Simplify the model conditions
    #Run model with several parameter values for a single variable
    #Analyze how output (using the currency you've decided on for your model) changed with that one parameter
    #Repeat for other parameters

#You really want to try to make your model break
    #really small or really large population size
    #Variance parameters set too high/low, leading to weird values being fed into functions
    #Syntax errors in sections of code that only get run occasionally
  #When you find things that cause your model to break add check for these things in the future
  # if(nrow(pop)<1){
      #print("Population size too small")
        #break #this causes the loops to stop
  #}

#We want single files to analyze if possible


#-------------------------------------------------------------------------------
#Pattern matching: 

#Theory development (pattern matching) focused on submodels/functions and how these work

#-------------------------------------------------------------------------------
#Anlyze

#Read concateneted files in R
