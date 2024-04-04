# 9.0-Binomial-Logistic-Regression

# Binomial vs. Multinomial Logistic Regression
Two types of logistic regression models are binomial and multinomial logistic regression. Binomial logistic regression is used when your outcome is categorical with binary values (e.g., grade: pass/fail). Multinomial logistic regression is used when your outcome is categorical with more than two values (e.g., grade: A, B, C, D, F). In this class we’ll focus on binomial logistic regression.

![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/5cf806a6-ad74-47ad-bd63-74173985f673)

# Running Logistic Regression in R
In R we use the glm() function to conduct logistic regression. The abbreviation ‘glm’ stands for generalized linear model. The command takes the following form:
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/a1674b7c-2a52-4b20-9181-19a5bdd22e9c)

![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/770b8c9a-9be1-4472-a0c5-8b65fd09cf55)

Similar to using the lm() function for simple and multiple regression, with the glm() function you will need to summarize your model to get the full range of statistics associated with your analysis:
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/81d89a4c-bc83-42df-837c-037837738dd2)

To see an example of how to use these functions with a set of data, download the penalty.csv file and upload it to your working directory. The data set includes four variables:

Scored: 0 = missed penalty; 1 = scored penalty
PSWQ: Penn State Worry Questionnaire
Previous: % of penalties scored by a player in their career
Anxious: anxiety level before taking the penalty shot
 

Use the following syntax to read the data in and run a logistic regression model.
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/4e7103f8-2ddb-4e3f-8dcc-7f62569bef72)

Note that R will code your outcome as 0 and 1 with the category that comes first alphabetically coded as 0 and the other category coded as 1. To override these defaults, you should run the following code before running your logistic regression model. This will make scored penalty the baseline category and missed penalty the category of interest.

Format:
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/e0ff8fec-b0c0-4126-9b4c-7518dd5a2c7e)

Example:
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/6237a3a1-ecf6-4059-9ff5-64e85c3d7f29)

Interpreting the Results
Below is a screenshot of the sample output you would see in R when running a binominal logistic regression. The values highlighted in yellow are the key values you would use to interpret the results. These values are the intercept (b0): -4.90010, the slope (b1): 0.29397, the significance of the predictor (p-value): 1.31e-05 or .0000131,  the null deviance: 103.638, and the residual deviance: 60.516.

The next few sections will describe how the intercept, slope, null deviance, and residual deviance are used to determine the odds ratio and evaluate the fit of the model.

![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/d349de4c-223c-401b-b5f9-9e4f6a8a5c3f)

Regression Equation
In logistic regression the line of best fit is estimated using maximum likelihood estimation. This method keeps testing models until it finds the coefficients that would have made the observed values of Y most likely to have occurred. Therefore instead of using the resultant regression equation to determine the value of Y (based on different values of X), we use the equation to determine the probability of Y (based on values of X). The regression equation therefore has the following format:

Format:    ![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/27363822-e5aa-4408-a009-0df2e8329d13)

It is important to note that in this equation e represents Euler’s number of 2.718.

Example: ![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/c2a53e10-afcd-419c-a8a7-4c0f6be82fdc)

P(Y) varies between 0 and 1. Close to 0 means Y is very unlikely to have occurred. Close to 1 means Y is very likely to have occurred. Just like with simple regression analysis you can plug values into this equation to find the value of P(Y). You can do this by hand on a calculator or by using R. For example, when PSWQ is equal to 1 the P(Y) can be calculated in R as:
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/2f262332-ca76-4527-b925-25b800d730d8)

After plugging this code into R, you would get the following value in the R console: 0.123467. This is your P(Y), when your predictor (PSWQ) is equal to 10.

Determining the Odds Ratio
Odds ratios help us determine the strength of our effect in logistic regression. Unlike the R coefficient from simple/multiple regression, the odds ratio ranges between zero to infinity.

To determine the odds ratio we need to:

Determine the odds of the outcome when X is low
Determine the odds of the outcome for 1 unit increase in X
Divide the second set of odds by the first set of odds
 

Below are step-by-step instructions on how to determine the odds ratio for the sample output provided.

Step 1: Determine the probability that the team scores a penalty shot, when their worry is low (i.e., PSWQ = 1).
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/855adae2-43e8-459c-b776-2cbf7f0729b0)

Step 2: Determine the probability that the team scores a penalty shot, when worry increases by 1 unit (i.e., PSWQ = 2).
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/20b05838-a8fa-4c17-9ea0-82a9dc318947)

Step 3: Determine the ratio between both probabilities.
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/58cc3e0e-5885-4f8e-96d6-71806ed091b7)

Our odds ratio is equal to 1.34. Given that our outcome is coded with “Scored Penalty” as the baseline category, we can conclude that there is a 1.34 times (or a 34%) increase in the odds of scoring a penalty for every 1 unit increase in worry.

 

These steps can also be completed in R as shown below.

Step 1: Determine the odds when PSWQ equals 1
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/85fd9f75-ae96-4548-be5d-2a0c35072a26)
Note: The values calculated above will appear in your Global Environment under the “Values” section.

 

Step 2: Determine the odds when PSWQ equals 2
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/f73c7bda-a2e4-4577-8d18-b366a7f447e1)
Note: The values calculated above will appear in your Global Environment under the “Values” section.

 

Step 3: Determine the odds ratio
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/c690713a-a1cb-4654-87d8-04f7ea6f3088)
Note: The values calculated above will appear in your Global Environment under the “Values” section.

 

A shortcut for this 3-step process in R is to use the following command on the object storing the regression model:
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/386f7a17-7ec8-478c-ae2b-22de31625429)
Note: The value under the predictor would be considered the odds ratio.

![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/7db3d94f-72e8-4f4c-8fee-65c91e9e4372)

When interpreting odds ratios it is helpful to think about how they deviate from 1. An odds ratio of 1 indicates that as the predictor increases the odds of the outcome increasing or decreasing are the same. This essentially means that the predictor has little to no effect on the outcome. An odds ratio greater than 1 indicates that as the predictor increases the odds of the outcome occurring increases. An odds ratio less than 1 indicates that as the predictor increases the odds of the outcome occurring decreases.
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/6377b53f-d29d-492d-a08e-5c638b6647d2)

Note that it can oftentimes be difficult to interpret odds ratios that are below 1. Therefore if you ever calculate an odds ratio that is below 1, you should try to relevel your outcome using the relevel() function so that the level of Y that is used as the baseline category is switched. You can then recalculate and reinterpret your odds ratio.

 

Assessing Model Fit
We will assess the model fit using a Pseudo R2. Unlike other R2s, a Pseudo R2 does not represent the percent of variance in the outcome explained by the predictors, instead this metric represents how much the fit of the model improves as a result of the inclusion of the predictor variables. It can vary between:

0 = the predictors are useless in predicting the outcome and
1 = the model predicts the outcome perfectly
There are several Pseudo R2s for logistic regression (e.g., Cox and Snell’s R2, Hosmer and Lemeshow’s R2). Even though not discussed in your text, one of the most popular ones is the McFadden R2. It can be determined using the following equation:
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/612752d3-3841-4a9a-9ac3-6c8edc9c683f)
Values higher than 0.2 represent good fit, with higher values indicating better fit than lower values. In the example in the R output, the McFadden R2 would be:
![image](https://github.com/Xnrrrrrr/9.0-Binomial-Logistic-Regression/assets/133546385/f1813fd8-48bc-45dd-9c10-1166636abc3a)

This indicates good fit.




















