#Start of model

#-------------------------------------------------------------------------------
#Initialize Population
#We need to set the population for the model and assign values to various 
#parameters. These include gender, race, and education (which will be determined
#based on the individuals gender and race with a nested loop)

#Add in other demographics later? Maybe age, zipcode, angler, visit motivations

eds=unique #This is our original data, which will be loaded in

#Set the different population parameters
  #This will be characterized from our original data
gender = unique(data$gender)
races = unique(data$race) 

#Nested loop (set genders --> race --> education)
education #Need help getting the loop code

#This if:then nested loop means...
#if Gender/Race is...
#Then Education is...

      for(g in 1:length(genders)){
        for(r in(1:length(races))){
          pop$ed[pop$gender==gender[g] & pop$races==races[t]] = sample(
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
