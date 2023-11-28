################################################################################ 
#                                                                              #
# Alabama Coastal Tourism Agent-Based Model                                    #
#                                                                              #
################################################################################

#-------------------------------------------------------------------------------

# Load your raw data from the CSV file
raw_data <- read.csv(file.choose())  # Replace "your_file.csv" with your actual file path

# CSV columns are named "race", "gender", and "education"
race_values <- na.omit(unique(raw_data$Race))
gender_values <- na.omit(unique(raw_data$Gender))
education_values <- na.omit(unique(raw_data$Education))

# Calculate nested proportions for all combinations in your raw data
nested_counts <- list()

for (gender in gender_values) {
  for (race in race_values) {
    for (edu in education_values) {
      count <- sum(!is.na(raw_data$Gender) & !is.na(raw_data$Race) & !is.na(raw_data$Education) &
                     raw_data$Gender == gender & raw_data$Race == race & raw_data$Education == edu)
      nested_counts[[paste(gender, race, edu)]] <- count
    }
  }
}

# Function to generate population based on nested proportions and adjust for rounding discrepancies
generate_population <- function(size, counts) {
  total_counts <- sum(unlist(counts))
  scaling_factor <- size / total_counts
  
  generated_population <- data.frame()
  remaining_individuals <- size
  
  for (gender in gender_values) {
    for (race in race_values) {
      for (edu in education_values) {
        # Calculate the number of individuals for each combination and adjust for rounding discrepancies
        count <- round(counts[[paste(gender, race, edu)]] * scaling_factor)
        individuals <- data.frame(
          gender = rep(gender, count),
          race = rep(race, count),
          education = rep(edu, count)
        )
        # Update remaining individuals after rounding
        remaining_individuals <- remaining_individuals - count
        
        # Combine generated individuals into the population dataframe
        generated_population <- rbind(generated_population, individuals)
      }
    }
  }
  
  # Distribute remaining individuals based on rounding differences
  if (remaining_individuals > 0) {
    extra_individuals <- raw_data[sample(nrow(raw_data), remaining_individuals), ]
    generated_population <- rbind(generated_population, extra_individuals)
  }
  
  return(generated_population)
}

# Function to calculate proportions in the generated population
calculate_generated_proportions <- function(population) {
  return(prop.table(table(population$race, population$gender, population$education)))
}

# Generate population using the nested proportions and adjusted rounding
population_size <- 2000  # Adjust as needed
population <- generate_population(population_size, nested_counts)

# Calculate proportions in the generated population
generated_proportions <- calculate_generated_proportions(population)

# Calculate proportions in the original datasetR
original_proportions <- prop.table(table(raw_data$Race, raw_data$Gender, raw_data$Education))

# Compare proportions between original and generated data
proportions_match <- all.equal(original_proportions, generated_proportions)

# View the comparison result
print(proportions_match)

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

