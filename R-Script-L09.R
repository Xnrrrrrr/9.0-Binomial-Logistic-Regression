# Step 1: Load the data file in R
logregData <- read.csv("cyber-attack-v4.csv", header=TRUE)

logregData$Fin_loss <- as.factor(logregData$Fin_loss)

# Step 2: Run a Logistic Regression analysis using glm() function.
library(car)
logReg <- glm(Fin_loss~response_time, data=logregData, family = binomial)
summary(logReg)

# Step 3: Determine the odd ratio following the steps below
# Step 3a - Calculate probabilities given response time (X) = 1; response time (X) = 2
# P(Y) when X=1
p.finLoss.1 <- 1/(1+(exp(-(-3.7491+ (0.0065*1)))))

# P(Y) when X=2

p.finLoss.2 <- 1/(1+(exp(-(-3.7491+ (0.0065*2)))))

# Step 3b: determine the odds from probabilities

Odds.1 <- p.finLoss.1/(1-p.finLoss.1)
Odds.2 <- p.finLoss.2/(1-p.finLoss.2)

# Step 3c: Determine the odds ratio

OR <- Odds.2/Odds.1

# Step 4: Determine the odds ratio using the following command on the object storing the regression model:

exp(logReg$coefficients)

# Step 5: Use relevel() function to change the baseline category of your outcome variable, which is Fin_loss in this case.

logregData$Fin_loss <- relevel(logregData$Fin_loss, "YES")

# Step 6: Calculate R-squared from residuals included in outputs.

nullDev <- logReg$null.deviance 
residualDev <- logReg$deviance
Rsquared <- 1 - (residualDev/nullDev)
