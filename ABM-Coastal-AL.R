#Start of model

#-------------------------------------------------------------------------------
#Initialize Population

eds=unique

gender = unique(data$gender) #Male = M and Female = F
races = unique(data$race) #Native, White, Black, Asian
education
    
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

#Agents (Additive or multiplicative)



#Set parameters
  #Race
  #Gender 

  #if:then
    #if Race is...
      #Then Education is...

  #if:then
    #Race (0:non-white, 1:white)
    #Gender (0:male, 1:female)
    #Education (0:lower, 1:higher)

#Environment

#i love turtles