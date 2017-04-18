# Global Terrorism Analysis -- Analyzing "Effectiveness" in Global Terrorism in R

# External Links
Presentation: https://goo.gl/IdPOZB
Data: https://drive.google.com/file/d/0BwSZcpSXYA2GcGlhX3hWOTZ1OU0/view?usp=sharing
Data Codebook: https://drive.google.com/a/uw.edu/file/d/0B2srRYTS4HQrajBtekJhMm9TcDg/view?usp=sharing


The dataset of the current study was collected by START researchers at the University of Maryland:

__The Global Terrorism Database (GTD) is an open-source database including information on terrorist events around the world from 1970 through 2015 (with annual updates planned for the future). Unlike many other event databases, the GTD includes systematic data on domestic as well as international terrorist incidents that have occurred during this time period and now includes more than 150,000 cases. (START, 2016)__

The data is housed in a 139 mb .csv file, with 137 variables pertaining to terrorist attack ID, date, incident, location, attack, weapon, target/victim, and perpetrator information, casualties and consequences, as well as additional information from “publicly available, unclassified source materials” (START, 2016). Variables of interest include numerical (e.g. number of fatalities), text (e.g. group name), and categorical variables (e.g. success). The current study aims to look at a subset of these data, specifically the 2693 attacks that occurred in the US from 1970 to 2015. 
   
  
# Introduction

In the wake of 9/11, terrorism has had an immense effect on shaping the foreign and domestic policies of the Bush, Obama, and Trump presidential administrations (Record, 2004; Obama, 2007; Trump, 2016). However, “despite the enormous resources devoted to countering terrorism, surprisingly little empirical information is available on which strategies are most effective” (LaFree & Dugan, 2009). Furthermore, as evidenced by the 2015 San Bernardino and 2016 Orlando Nightclub shootings, the US remains at risk of attack. For these reasons, the current research aims to perform exploratory analyses on one of the largest publicly available empirical terrorism databases, the Global Terrorism Database (GTD) by the National Consortium for the Study of Terrorism and Responses to Terrorism (START, 2016). Authors of the GTD define a terrorist attack as “the threatened or actual use of illegal force and violence by a non‐state actor to attain a political, economic, religious, or social goal through fear, coercion, or intimidation” (START, 2016). Furthermore, the current research aims to uncover general trends and generate insights that can be used to better understand and thereby combat terrorist attacks on US soil.	

# Research Question

From 1970 to 2015, what are common traits of the 2693 terrorist attacks that occurred within the US, and how can these commonalities be used to aid military, law enforcement, and intelligence agencies in the prevention of future attacks?

## Secondary Questions

1. What factors (target, attack, weapon type, etc.) predict whether or not a terrorist attack in the United States was considered a “success”?
2. What factors (number of attackers, attack type, etc.) predict the number of casualties (victims killed or wounded)?
3. What factors (motive, attack type, etc.), predict whether or not a hostage or hostages were taken?

# Potential Analysis Methods

To answer our primary research questions, we will undertake a thorough exploratory data analysis involving the variables listed above, re-coding or engineering new variables as necessary. EDA will comprise of identifying central tendency and quartiles via boxplots, plotting histograms, and testing for normality and outliers when necessary.

There are two ways to identify which factors or variables account for each dependent variable. For binary dependent variables (such as attack success), we could perform a random forest analysis to identify which variable(s) account for the most variance in attack success. Alternatively, we can test the pearson correlation between continuous dependent and independent variables. Independent variables with the strongest positive correlations would help answer our question (although as an observational study there’s no way to prove causality (Höfler, 2005)).

As a possible extension of this project, we could incorporate the 3-5 most important independent variables into a single regression model that predicts each outcome listed in our secondary questions.

# Expected Results and Discussion

We expect that one to three key factors will emerge to predict attack success, number of casualties, and number of hostages taken. We also expect that the 9/11 attacks will significantly skew the dataset when referring to casualties, and will likely have to test a number of data cleaning approaches (for instance, utilizing logistic scaling and tests for outliers).

If we are able to answer the research question of what best predicts whether or not a terrorist attack was successful, that information would be useful to law enforcement, the military, and government agencies in potentially mitigating future attacks. Similarly, being able to predict the amount of casualties given certain attack characteristics might help agencies develop policies that mitigate against those attacks in the future. For instance, if bomb-related attacks are discovered to have a strong relationship with total attack casualties, then counter-terrorism measures could be appropriated accordingly.
