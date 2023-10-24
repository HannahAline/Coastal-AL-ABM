################################################################################
#                                                                              #
# Alabama Coastal Tourism Agent-Based Model                                    #
#                                                                              #
################################################################################

#Individual based
#  - each person/agent has properties
#  - parameters and attributes
#  - Agents/individuals to have behaviors based on those parameters


Agent1 <- data.frame(AgentNo = 1, #Each row is going to tell you about that agent
                     Gender = "g", 
                     Race = "r",
                     Education = 'e',
                     Dolphin = runif(1,0,1)) #This determines how often they interact
                                            #with dolphins - Randomly gen variable

# Create a population of Agents
nPop1 <- 10 #This is how large the population is, and can be changed later on

for( i in 2:nPop1){
  Agent2 <- data.frame(AgentNo = i, #Each row is going to tell you about that agent
                       Gender = "g",
                       Race = "r",
                       Education = 'e',
                       Dolphin = runif(1,0,1))
  Agent1 <- rbind( Agent1, Agent2)
  
} # Thats for how many agenst are in the population

#Determine if they like to meet others
Mix1 <- Agent1$Dolphin[ i ]
#How many agents will they meet
Meet1 <- round(Mix1*3,0) #This allows us to see how many people they are going to meet
#Grab the agents they will meet
Meet2 <- sample( 1:nPop1, Meet1, replace = TRUE)

for( j in 1:length(Meet2) ){
  Agent1[ Meet2[j], ]
}

#parameters
eds           =unique #This is our original data, which will be loaded in
pop           = data.fram(id = seq(1,npop, 1))#create an object for pop here

timeperiod    = 50 #or years
sexratio      = 0.5 
race          =
#if you think you will change this later on, it is easier to put in as a parameter
#Add in other demographics later? Maybe age, zipcode, angler, visit motivations




















#-------------------------------------------------------------------------------
#Initialize Population
#We need to set the population for the model and assign values to various 
#parameters. These include gender, race, and education (which will be determined
#based on the individuals gender and race with a nested loop)





#Set the different population parameters
  #This will be characterized from our original data
gender = unique(data$gender)
races = unique(data$race) 

#Nested loop (set genders --> race --> education)
education #Need help getting the loop code

#This if:then nested loop means...
#if Gender/Race is...
#Then Education is...


      for(g in 1:length(genders)){ #number of genders - 2
        
        for(r in(1:length(races))){ #number of races - 4
          pop$ed[pop$gender==gender[g] & pop$races==races[t]] = sample( #
            eds.t=data$eds[pop$gender==gender[g] & pop$races==races[t]]
            eds.tt=table(eds.t)
            eds.tt/sum(eds.tt)
            
            sample(colnames(eds.tt), probs=eds.tt, replace=T)
          )
        }

      }

#-------------------------------------------------------------------------------       
#Set behaviors and model rules based on their demographics (gender, race, education)        

#Set their knowledge of wildlife/policy based on their demographics
#This is related to their willingness to change behavior

#(we will get this relationship from the glm we are running)
  #i.e. males are less likely, white is less likely, etc.

#These if:then rules are based on their demographic variables
  #Such as, IF they are more knowledgeable about wildlife based on their
  #demographics, THEN they are more willing to change their behavior

#-------------------------------------------------------------------------------       
#Let the model run with the given rules from above

#Set loop length, maybe 1 week?

#Here we could also put an education component, which would change peoples behaviors
  #Maybe a probability of encountering signage

#We want to be able to change peoples ability to 'learn' and 'forget' rules

#-------------------------------------------------------------------------------
#Output

#Here we will record the results of the iteration

#-------------------------------------------------------------------------------
#End
