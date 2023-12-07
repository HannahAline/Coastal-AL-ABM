# ABM-Coastal-AL

### Overview - purpose
The main objective of this agent-based model is to explore and understand educational information dissemination for stakeholders to change their behavior towards common bottlenose dolphins (Tursiops truncatus) and Gulf of Mexico sea turtles (e.g. Loggerhead (Caretta caretta), Kemp’s Ridley (Lepidochelys kempii), and Green Sea Turtles (Chelonia mydas)) as predicted by indicators such as demographics (race, gender, education).

This model seeks to answer:
Who do the stakeholders tend to be that are more willing to change their behavior to reduce negative interactions with dolphins and sea turtles, as predicted by demographics (race, gender, education), general attitudes of marine wildlife, basic knowledge of the laws, and species’ biology, and motivations of coming to the coast?

### Overview - entities, state variables, and scales
1. Entities: The model simulates individual people as the agents, these are individuals who go to the coast of Alabama with intentions of recreating, where the demographics of such people are predicted to change in some way (the average age is increasing/decreasing, a larger percent of one race over others, etc.).
   
2. State variables: Each individual person will have a range of demographics: race, gender, and education level. 
   
3. Scales: The model operates on a temporal scale. Temporally, it simulates that as time passes and variables of the individual change, their willingness to change certain behaviors also changes.
   
### Overview - processes
Individuals will have ability to learn and forget education material. Their level of knowledge will dictate how the agents behave.
### Design concepts
1. Basic Principles: The model is based on an analysis of human-wildlife interactions with social science through survey data.
2. Emergence: The model aims to capture emergent phenomena related to agent knowledge from educational materials, related to their demographics. 
3. Adaptation: Agents (individuals) are assigned demographics based on the current survey data, and in the future can be based on census data.
4. Objectives: The primary objective of the model is to test how different educational material dissemination methods will influence population behavior.
### Details - 
1. Initialization: The simulation begins with a defined number of individuals assigned demographics based on nested proportions. 
2. Input data: As time progresses, demographics are projected to change in a specific way that is related to current demographic data (e.g. younger people are going to the coast, more educated people are going to the coast, etc.)
3. Submodels: These include 1) nested proportions, 2) opportunity to interact with the different educational material types, 3) ability to learn, 4) opportunity to forget, 5) chance to do a behavior (either positive or negative)
4. Parameters: Model parameters include various demographics for individuals, educational material types, and behavioral responses.
5. Observations: Stakeholders demographics and: 
    1. Knowledge
    2. Behavior
    3. Information Sources (to add in the future)
6. Initialization and termination: The simulation begins at time step one and can continue for 10 steps.
