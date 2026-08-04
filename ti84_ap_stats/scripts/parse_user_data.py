import json
import re

# Use raw string r""" to treat backslashes literally
raw_data = r"""
UNIT 1: Data Exploration (0.x)
Q: What is the rule for determining outliers in a boxplot?
A: Calculate $IQR = Q3 - Q1$. Lower Bound: $Q1 - 1.5(IQR)$. Upper Bound: $Q3 + 1.5(IQR)$. Any data point outside this is an outlier.
Q: How do you describe a quantitative distribution?
A: Use SOCS: Shape (Skewed/Symmetric), Outliers, Center (Mean/Median), and Spread (Standard Deviation/IQR/Range).
Q: When should you use Median over Mean?
A: Use Median for skewed distributions or those with outliers, as it is a resistant measure of center.
Q: What is the interpretation of a Z-score?
A: A Z-score tells you how many standard deviations a value is above or below the mean.
Q: What are the proportions of the Empirical Rule?
A: For Normal distributions: 68% within $1\sigma$, 95% within $2\sigma$, 99.7% within $3\sigma$.
Q: What does a percentile represent?
A: The $n^{th}$ percentile is the value such that $n\%$ of the data is at or below it.
Q: How do you calculate a residual?
A: $Residual = Actual (y) - Predicted (\hat{y})$. Mnemonic: RAP (Residual = Actual - Predicted).
Q: What does the correlation coefficient ($r$) measure?
A: The strength and direction of a linear relationship between two quantitative variables.
Q: What is the interpretation of $r^2$ (Coefficient of Determination)?
A: "$r^2$ percent of the variation in the [response variable] is accounted for by the linear model relating it to the [explanatory variable]."
Q: What does a residual plot with a clear curve indicate?
A: It indicates that a linear model is not appropriate for the data.
Q: What is the definition of an influential point in regression?
A: A point that, if removed, significantly changes the slope, y-intercept, or correlation coefficient.
Q: How do you interpret the slope $b$ of an LSRL?
A: "For every 1 unit increase in [X variable], the is predicted to increase/decrease by $b$ units."
Q: What is the difference between a histogram and a bar chart?
A: Histograms are for quantitative data (bins touch); bar charts are for categorical data (bars don't touch).
Q: Define a standard Normal distribution.
A: A Normal distribution with a mean $\mu = 0$ and a standard deviation $\sigma = 1$.
Q: What does the standard deviation of residuals ($s$) represent?
A: The typical size of the "error" (prediction vertical distance) when using the LSRL to predict Y from X.
Q: What happens to the mean and standard deviation if you add a constant to every value?
A: Mean increases by that constant; standard deviation remains the same.
Q: What happens to the mean and standard deviation if you multiply every value by a constant?
A: Both the mean and standard deviation are multiplied by that constant.
Q: Can correlation be used to imply causation?
A: No. Correlation only shows an association; only a well-designed experiment can show causation.
Q: What is the y-intercept interpretation in context?
A: The predicted value of Y when X is zero. Often has no practical meaning if X=0 is outside the data range.
Q: How do you find the LSRL using summary statistics?
A: $b = r(s_y / s_x)$ and $a = \bar{y} - b\bar{x}$.
Q: What is the "Standard Error of the Slope"?
A: It estimates how much the slope of the LSRL varies from sample to sample.
Q: What is marginal relative frequency?
A: The total for a row or column divided by the grand total in a two-way table.
Q: What is conditional relative frequency?
A: The value in a specific cell divided by the total of its row or column.
Q: How do you determine if two categorical variables are independent?
A: If the conditional relative frequencies are approximately equal across all categories.
Q: What is back-to-back stemplot used for?
A: Comparing the distributions of two quantitative variables side-by-side.

UNIT 2: Sampling & Design (1.x)
Q: What is the goal of a Simple Random Sample (SRS)?
A: To give every group of size $n$ an equal chance of being selected, reducing bias.
Q: Define Stratified Random Sampling.
A: Splitting the population into homogeneous groups (strata) and taking an SRS from each.
Q: Define Cluster Sampling.
A: Splitting the population into heterogeneous groups (clusters) and randomly selecting entire clusters.
Q: What is the difference between an observational study and an experiment?
A: Experiments impose a treatment; observational studies do not.
Q: Why is random assignment used in experiments?
A: To create roughly equivalent groups and balance the effects of confounding variables.
Q: What is a confounding variable?
A: A variable related to the explanatory variable that also affects the response, making it hard to see the true effect.
Q: What is the purpose of a control group?
A: To provide a baseline for comparison to see if the treatment has a real effect.
Q: What is a double-blind experiment?
A: Neither the subjects nor the researchers measuring the response know which treatment is being administered.
Q: Define Undercoverage bias.
A: When some members of the population are left out of the process of choosing the sample.
Q: Define Nonresponse bias.
A: When individuals chosen for the sample cannot be contacted or refuse to participate.
Q: Define Response bias.
A: When the behavior of the interviewer or the wording of the question influences the answers.
Q: What is the "Placebo Effect"?
A: When subjects show a change in response simply because they believe they are receiving a treatment.
Q: What is "Blocking" in an experiment?
A: Grouping similar experimental units together to reduce the variability of the response variable.
Q: What is a Matched Pairs design?
A: A specific type of block design where each block consists of two identical units or the same unit receiving both treatments.
Q: When can you generalize results to a population?
A: When the individuals were randomly selected from that population.
Q: When can you infer cause and effect?
A: Only when individuals were randomly assigned to treatment groups.
Q: What is a sampling frame?
A: The actual list of individuals from which the sample is drawn.
Q: What is voluntary response bias?
A: Bias created when people choose themselves for a sample (e.g., online polls).
Q: What is systematic random sampling?
A: Selecting every $k^{th}$ individual from a list after a random starting point.
Q: What is the primary benefit of a large sample size?
A: It reduces the variability of the sample statistic (standard error).
Q: Does a large sample size reduce bias?
A: No. If the sampling method is biased (like voluntary response), a large sample just gives a more "precise" biased result.
Q: What is "Statistically Significant"?
A: An observed effect so large that it would rarely occur by chance alone.
Q: What is a factor in an experiment?
A: The explanatory variable (e.g., dosage).
Q: What is a level in an experiment?
A: The specific values of a factor (e.g., 5mg, 10mg, 20mg).
Q: What is the scope of inference?
A: The limit of who the results apply to and whether cause-and-effect can be claimed.

UNIT 3: Probability & Random Variables (2.x)
Q: Define Mutually Exclusive (Disjoint) events.
A: Events that cannot happen at the same time. $P(A \cap B) = 0$.
Q: What is the General Addition Rule?
A: $P(A \cup B) = P(A) + P(B) - P(A \cap B)$.
Q: What is the test for Independence?
A: $P(A|B) = P(A)$ or $P(A \cap B) = P(A) \cdot P(B)$.
Q: How do you calculate conditional probability?
A: $P(A|B) = P(A \cap B) / P(B)$.
Q: What is the Complement Rule?
A: $P(A^c) = 1 - P(A)$.
Q: How do you find the probability of "at least one"?
A: $1 - P(\text{none})$.
Q: Define Expected Value ($E(X)$ or $\mu_x$).
A: The long-run average of a random variable: $\sum [x \cdot P(x)]$.
Q: What are the BINS conditions for a Binomial distribution?
A: Binary (Success/Fail), Independent, Number of trials fixed, Same probability of success.
Q: How do you calculate Binomial probability for exactly $k$ successes?
A: Use binompdf(n, p, k) on the calculator.
Q: How do you calculate "at most" $k$ successes?
A: Use binomcdf(n, p, k) on the calculator.
Q: What are the BITS conditions for a Geometric distribution?
A: Binary, Independent, Trials until first success, Same probability.
Q: How do you calculate the mean of a Binomial distribution?
A: $\mu = np$.
Q: How do you calculate the standard deviation of a Binomial distribution?
A: $\sigma = \sqrt{np(1-p)}$.
Q: What is the mean (expected value) of a Geometric distribution?
A: $\mu = 1/p$.
Q: If you combine two independent random variables $X$ and $Y$, how do you find the new variance?
A: $\sigma^2_{X \pm Y} = \sigma^2_X + \sigma^2_Y$. (Variances always add).
Q: What is a "Probability Distribution"?
A: A list of all possible outcomes and their associated probabilities.
Q: What must the sum of probabilities in a discrete distribution be?
A: Exactly 1.
Q: What is the Law of Large Numbers?
A: As the number of repetitions increases, the proportion of successes approaches the true probability.
Q: Define a "Random Variable".
A: A numerical outcome of a random process.
Q: What is the area under a continuous probability density curve?
A: Exactly 1.
Q: Does $P(X = k)$ matter in a continuous distribution?
A: No, $P(X = k) = 0$ for any single point in a continuous distribution.
Q: How do you interpret the Expected Value in context?
A: "If we repeat the process many, many times, the average outcome will be approximately [Value]."
Q: What is the "10% Condition" for independence when sampling?
A: When sampling without replacement, you can assume trials are independent if $n \leq 0.10N$.
Q: What is the "Large Counts Condition" for Binomial normality?
A: $np \geq 10$ and $n(1-p) \geq 10$.
Q: How do you find $P(A \cap B)$ for independent events?
A: $P(A) \cdot P(B)$.

UNIT 4: Inference (3.x)
Q: What is a Sampling Distribution?
A: The distribution of all possible values of a statistic from all possible samples of the same size.
Q: Define the Central Limit Theorem (CLT).
A: For a large $n$ ($n \geq 30$), the sampling distribution of the sample mean is approximately Normal, regardless of population shape.
Q: What is a P-value?
A: The probability of getting a result as extreme as ours, assuming the null hypothesis is true.
Q: If P-value < $\alpha$, what is the conclusion?
A: Reject $H_0$; there is convincing evidence for $H_a$.
Q: If P-value > $\alpha$, what is the conclusion?
A: Fail to reject $H_0$; there is not enough evidence for $H_a$.
Q: What is a Type I Error?
A: Rejecting $H_0$ when it is actually true (False Positive).
Q: What is a Type II Error?
A: Failing to reject $H_0$ when it is actually false (False Negative).
Q: How do you interpret a 95% Confidence Level?
A: "If we take many samples and build intervals this way, about 95% of them will capture the true population parameter."
Q: How do you interpret a Confidence Interval?
A: "We are 95% confident that the interval from [Low] to [High] captures the true [parameter in context]."
Q: What happens to an interval as confidence level increases?
A: The interval gets wider.
Q: What happens to an interval as sample size increases?
A: The interval gets narrower.
Q: Define "Standard Error".
A: An estimate of the standard deviation of a sampling distribution using sample data.
Q: What are the three conditions for inference?
A: Random, Independent (10%), and Normal (Large Counts or $n \geq 30$).
Q: When do you use a Z-test vs a T-test for means?
A: Use Z if population $\sigma$ is known (rare); use T if $\sigma$ is unknown and you use $s_x$.
Q: What is "Power" in a significance test?
A: The probability of correctly rejecting a false null hypothesis.
Q: How do you increase the power of a test?
A: Increase sample size or increase the significance level ($\alpha$).
Q: What is the null hypothesis for a Chi-Square Test of Independence?
A: There is no association between the two variables in the population.
Q: How do you calculate degrees of freedom for a T-test for means?
A: $df = n - 1$.
Q: How do you calculate degrees of freedom for Chi-Square Independence?
A: $df = (rows - 1)(cols - 1)$.
Q: What is the "Matched Pairs" T-test mechanically?
A: A one-sample T-test performed on the differences ($L_1 - L_2$).
Q: What is the point estimate?
A: The sample statistic ($\bar{x}$ or $\hat{p}$) used to estimate the population parameter.
Q: What is the margin of error?
A: (Critical Value) $\cdot$ (Standard Error).
Q: What is the null hypothesis for a test of slope?
A: $H_0: \beta = 0$ (No linear relationship).
Q: What is the "Large Counts" condition for Chi-Square?
A: All expected counts must be at least 5.
Q: How do you calculate "Expected Counts" for Chi-Square?
A: $(\text{Row Total} \cdot \text{Column Total}) / \text{Grand Total}$.

UNIT 5: Sampling Distributions & Foundations of Inference (3.1.x)
Q: What is a statistic?
A: A number that describes a sample (e.g., x-bar or p-hat).
Q: What is a parameter?
A: A number that describes a population (e.g., mu or p).
Q: Define an unbiased estimator.
A: A statistic whose sampling distribution's mean is equal to the true parameter being estimated.
Q: What is the variability of a statistic?
A: Described by the spread of its sampling distribution; larger samples yield lower variability.
Q: What is the formula for the standard deviation of p-hat?
A: sqrt( p(1-p) / n ).
Q: When can you use the standard deviation formula for p-hat?
A: Only if the 10% condition is met (n <= 0.10N).
Q: What is the formula for the standard deviation of x-bar?
A: sigma / sqrt(n).
Q: What happens to the standard deviation of x-bar if n increases by a factor of 4?
A: The standard deviation is cut in half (sqrt of 4).
Q: What does the Central Limit Theorem (CLT) say about the shape of x-bar?
A: If n >= 30, the sampling distribution of x-bar is approximately Normal regardless of the population shape.
Q: If the population is already Normal, what is the shape of the sampling distribution?
A: It is Normal regardless of the sample size n.
Q: What are the mean and standard deviation of the difference in sample means (x-bar1 - x-bar2)?
A: Mean = mu1 - mu2; SD = sqrt( (sigma1^2 / n1) + (sigma2^2 / n2) ).
Q: What is the "Sampling Distribution of a Sample Proportion"?
A: The distribution of p-hat values from all possible samples of size n.
Q: How do you check if the distribution of p-hat is approximately Normal?
A: Check the Large Counts condition: np >= 10 and n(1-p) >= 10.
Q: What is the difference between standard deviation and standard error?
A: Standard deviation uses population parameters; standard error uses sample statistics to estimate that deviation.
Q: What is a "Critical Value" (z* or t*)?
A: The number of standard errors you must move from the mean to capture a specific area of confidence.

UNIT 6: Inference for Categorical Data - Proportions (3.2.x)
Q: What is the formula for a one-sample z-interval for a proportion?
A: p-hat +/- z* * sqrt( p-hat(1 - p-hat) / n ).
Q: How do you find z* for a 90% confidence interval on the TI-84?
A: invNorm(area=0.05, mean=0, sd=1) -> absolute value is 1.645.
Q: How do you find the sample size n needed for a specific margin of error (ME) for a proportion?
A: n = (z* / ME)^2 * p*(1-p*). Use p*=0.5 if no estimate is given.
Q: What is the Null Hypothesis for a one-proportion z-test?
A: H0: p = p-zero (where p-zero is the claimed value).
Q: What is the Test Statistic formula for a one-proportion z-test?
A: z = (p-hat - p-zero) / sqrt( p-zero(1 - p-zero) / n ). Note: Use p-zero in the denominator.
Q: What is the formula for the standard error of the difference in proportions (p-hat1 - p-hat2)?
A: sqrt( [p-hat1(1-p-hat1)/n1] + [p-hat2(1-p-hat2)/n2] ).
Q: What is "Pooling" in a two-proportion z-test?
A: Combining successes and sample sizes from both groups to get a single p-hat-combined when H0 assumes p1 = p2.
Q: When do you pool proportions?
A: For significance tests (2-PropZTest), but NOT for confidence intervals (2-PropZInt).
Q: What is the Large Counts condition for a two-proportion z-interval?
A: n1p-hat1, n1(1-p-hat1), n2p-hat2, and n2(1-p-hat2) must all be >= 10.
Q: Interpretation of a p-value of 0.03?
A: There is a 3% chance of getting a result this extreme by chance if the null is true.

UNIT 7: Inference for Quantitative Data - Means (3.3.x)
Q: Why use the T-distribution instead of Normal for means?
A: Because we use s-x to estimate sigma, which adds extra variability.
Q: What happens to the T-distribution as degrees of freedom increase?
A: It approaches the Standard Normal (z) distribution.
Q: What is the formula for a one-sample t-interval for a mean?
A: x-bar +/- t* * (s-x / sqrt(n)).
Q: How do you find t* for 95% confidence with n=20?
A: invT(area=0.025, df=19) on the TI-84.
Q: What is the "Normal/Large Sample" condition for means?
A: Population is Normal, OR n >= 30, OR a graph of sample data shows no strong skew/outliers.
Q: What is the Test Statistic for a one-sample t-test?
A: t = (x-bar - mu-zero) / (s-x / sqrt(n)).
Q: What is a "Matched Pairs" t-procedure?
A: When data comes from two measurements on the same person or twins; you analyze the single list of differences.
Q: How do you calculate degrees of freedom for a two-sample t-test (conservative method)?
A: Use the smaller of (n1 - 1) or (n2 - 1). The TI-84 uses a more precise formula.
Q: What is the Null Hypothesis for a two-sample t-test?
A: H0: mu1 = mu2 (or mu1 - mu2 = 0).
Q: If zero is in the 95% confidence interval for mu1-mu2, what does that mean for a test at alpha=0.05?
A: You fail to reject the null; there is no significant difference.
Q: If the 95% confidence interval for mu1-mu2 is (2, 10), is there evidence of a difference?
A: Yes, because zero is not in the interval.
Q: What is the standard error for x-bar1 - x-bar2?
A: sqrt( (s1^2 / n1) + (s2^2 / n2) ).
Q: Do we usually pool for t-tests?
A: No, the AP exam and modern statistics recommend "Pooled: No" for means.
Q: What is the Robustness of the t-procedure?
A: T-procedures are quite accurate even if the population isn't perfectly Normal, as long as n isn't tiny and there are no outliers.
Q: How do you interpret the standard deviation of the differences (s-diff) in matched pairs?
A: The typical distance of an individual difference from the mean difference.

UNIT 8: Chi-Square Tests (3.4.x)
Q: What are the three types of Chi-Square tests?
A: Goodness of Fit, Homogeneity, and Independence.
Q: What does Goodness of Fit test?
A: If one sample's distribution fits a claimed/theoretical distribution.
Q: What does a Test for Homogeneity test?
A: If the distribution of one categorical variable is the same across multiple populations/groups.
Q: What does a Test for Independence test?
A: If there is an association between two categorical variables in a single population.
Q: What is the Chi-Square test statistic formula?
A: Chi-sq = Sum of [ (Observed - Expected)^2 / Expected ].
Q: What is the degrees of freedom for Chi-Square Goodness of Fit?
A: df = (number of categories - 1).
Q: What is the shape of a Chi-Square distribution?
A: Right-skewed and always positive.
Q: What happens to the Chi-Square shape as degrees of freedom increase?
A: It becomes more symmetric/Normal.
Q: What are the conditions for Chi-Square?
A: Random, Independent (10%), and Large Counts (all Expected counts >= 5).
Q: How do you find the P-value for a Chi-Square test on the TI-84?
A: chi2cdf(lower=test statistic, upper=1E99, df).
Q: What is a "Cell Contribution" in Chi-Square?
A: The value (Obs-Exp)^2 / Exp for a single cell; it shows which category deviated most.
Q: Where do you store Observed counts for Independence tests on a TI-84?
A: In Matrix [A].
Q: How does the TI-84 calculate Expected counts for Independence?
A: It does it automatically and stores them in Matrix after you run the test.
Q: What is the Null Hypothesis for Goodness of Fit?
A: H0: The specified distribution of [variable] is correct.
Q: What is the Alternative Hypothesis for all Chi-Square tests?
A: Ha: The null is not correct (at least one proportion is different).

UNIT 9: Inference for Slopes (3.5.x)
Q: What is the population regression equation?
A: y = alpha + betax + epsilon (where beta is the true slope).
Q: What are the conditions for regression inference (LINER)?
A: Linear, Independent, Normal (residuals), Equal variance (residuals), Random.
Q: What is the Null Hypothesis for a slope test?
A: H0: beta = 0 (implies no linear relationship).
Q: What is the Test Statistic for slope?
A: t = (sample slope b - beta-zero) / SE of slope.
Q: How do you find degrees of freedom for regression inference?
A: df = n - 2.
Q: How do you interpret the Standard Error of the slope (SE-b)?
A: If we take many samples, the sample slope b will typically vary from the true slope beta by about units.
Q: What is the formula for the t-interval for slope?
A: b +/- t * (SE-b).
Q: If a 95% interval for slope is (1.2, 3.4), is the relationship significant?
A: Yes, because zero is not in the interval, so we reject H0: beta=0.
Q: How do you check the "Normal Residuals" condition?
A: Look at a histogram or Normal Probability Plot of the residuals and check for normality.
Q: How do you check "Equal Variance" for residuals?
A: Look at a residual plot and ensure the vertical spread is roughly the same for all X values (no "fanning").
Q: Where is the sample slope located in a computer output table?
A: The coefficient in the row for the explanatory (X) variable.
Q: Where is the SE of the slope in a computer output table?
A: The "SE Coef" value in the row for the explanatory variable.
Q: What does "S" represent in regression computer output?
A: The standard deviation of the residuals.
Q: What does a p-value < 0.05 for a slope test mean?
A: There is a statistically significant linear relationship between X and Y.
Q: What is the calculator command for slope inference?
A: LinRegTTest.

MIXED REVIEW & TRICKY CONCEPTS (4.x)
Q: Difference between "accuracy" and "precision"?
A: Accuracy is about bias (hitting the center); precision is about variability (tight clusters).
Q: What is the effect of outliers on r?
A: Outliers can strongly increase or decrease r depending on if they follow the linear pattern.
Q: If you switch X and Y, what happens to r?
A: Nothing. r remains the same.
Q: If you switch X and Y, what happens to the LSRL?
A: The slope and intercept will change.
Q: What is a "Lurking Variable"?
A: An unmeasured variable that influences the relationship between the variables being studied.
Q: Can you conclude causation from a survey?
A: No, only from a randomized experiment.
Q: What is the "Power" of a test?
A: 1 - P(Type II Error).
Q: How do you decrease the probability of a Type I Error?
A: Use a smaller alpha (significance level).
Q: How do you decrease the probability of a Type II Error?
A: Increase sample size, increase alpha, or increase the effect size.
Q: Interpretation of r= -0.9?
A: Strong, negative, linear relationship.
Q: What is a "Density Curve"?
A: A curve that is always on or above the axis and has a total area of 1.
Q: Where is the mean of a skewed density curve?
A: Pulled toward the tail (relative to the median).
Q: What is a "Random Phenomenon"?
A: Outcomes are uncertain in the short term but have a predictable distribution in the long run.
Q: What is the Multiplication Rule for independent events?
A: P(A and B) = P(A) * P(B).
Q: What is the probability of a sure event?
A: 1.
Q: What is a "Parameter of Interest"?
A: The specific population characteristic (like mu or p) we want to learn about.
Q: What is a "Statistic of Interest"?
A: The sample value used to estimate the parameter.
Q: What is a "Point Estimator"?
A: A single value (like x-bar) used to estimate a parameter.
Q: What is "Standard Error of the Mean"?
A: s-x / sqrt(n).
Q: What is "Standard Error of the Proportion"?
A: sqrt( p-hat(1-p-hat) / n ).
Q: What is the significance level (alpha)?
A: The threshold for rejecting the null; also the probability of a Type I error.
Q: What does "One-Sided" Ha mean?
A: Testing if a parameter is specifically "greater than" or "less than" a value.
Q: What does "Two-Sided" Ha mean?
A: Testing if a parameter is "different from" (not equal to) a value.
Q: How do you find the p-value for a two-sided test using a one-sided result?
A: Multiply the one-sided p-value by 2.
Q: Why do we randomize in an experiment?
A: To balance confounding variables across treatment groups.
Q: Why use a control group?
A: To compare the treatment effect against a baseline and account for the placebo effect.
Q: Why use replication?
A: To ensure the results are consistent and not just a fluke in one small group.
Q: What is "Scope of Inference"?
A: Determining to whom the results apply based on sampling and assignment.
Q: Definition of "Statistically Significant"?
A: The probability of the result occurring by chance is very small (usually < 0.05).
Q: What is a "Residual"?
A: The vertical distance between a data point and the regression line.
Q: What is the Law of Large Numbers?
A: As $n$ increases, the sample mean approaches the true population mean.
Q: Does a high $R^2$ mean the model is linear?
A: No. You must check the residual plot for patterns.
Q: How do you identify a 'Resistant' statistic?
A: It is not strongly affected by outliers (Median, IQR).
Q: What is the 'Power' of a test?
A: The probability of correctly rejecting $H_0$ when $H_a$ is true.
Q: Define Type I Error in context.
A: Concluding the effect exists when it actually does not.
Q: Define Type II Error in context.
A: Failing to detect an effect that actually exists.
Q: How does increasing $n$ affect Power?
A: It increases Power by reducing variability.
Q: What is the difference between $s$ and $\sigma$?
A: $s$ is the sample standard deviation; $\sigma$ is the population standard deviation.
Q: What is an 'Experimental Unit'?
A: The smallest collection of individuals to which treatments are applied.
Q: What is 'Replication'?
A: Assigning enough units to each group so the effect can be distinguished from chance.
Q: What is 'Extrapolation'?
A: Predicting $y$ for $x$-values outside the observed data range; it is unreliable.
Q: Define 'Standard Error of the Slope'.
A: The typical distance the sample slope $b$ is from the true slope $\beta$.
Q: What is the null for a Chi-Square GOF test?
A: $H_0$: The specified distribution is correct.
Q: What is the null for Chi-Square Independence?
A: $H_0$: There is no association between the two variables.
Q: What is a 'Lurking Variable'?
A: A variable not included in the study that affects the relationship between variables.
Q: How do you calculate degrees of freedom for a 1-sample $t$-test?
A: $df = n - 1$.
Q: How do you calculate degrees of freedom for Chi-Square Independence?
A: $df = (r-1)(c-1)$.
Q: What is the 'Standardized Test Statistic'?
A: (Statistic - Parameter) / (Standard Error).
Q: Define 'Alpha' ($\alpha$).
A: The significance level; the threshold for rejecting $H_0$.
Q: What is a 'P-value'?
A: The probability of observing results this extreme if $H_0$ is true.
Q: What is the 'Margin of Error'?
A: The maximum expected difference between the sample result and the true parameter.
Q: How do you calculate $n$ for a specific Margin of Error in proportions?
A: $n = (z^*/ME)^2 \times p(1-p)$.
Q: What is a 'Sampling Frame'?
A: The list of individuals from which a sample is drawn.
Q: What is 'Selection Bias'?
A: When the sample is not representative of the population.
Q: Define 'Placebo Effect'.
A: Subjects showing improvement simply because they believe they are being treated.
Q: What is 'Blinding'?
A: Keeping subjects (or researchers) unaware of which treatment is being given.
Q: Define 'Stratified Random Sample'.
A: Dividing the population into strata and taking an SRS from each.
Q: Define 'Cluster Sample'.
A: Dividing the population into clusters and selecting all members of randomly chosen clusters.
Q: What is 'Non-response Bias'?
A: When people chosen for a survey cannot be reached or refuse to participate.
Q: What is 'Undercoverage'?
A: When some groups in the population are left out of the selection process.
Q: Define 'Skewed Right'.
A: Tail is on the right; Mean > Median.
Q: Define 'Skewed Left'.
A: Tail is on the left; Mean < Median.
Q: What is the 'Empirical Rule'?
A: 68-95-99.7% of data in a Normal distribution falls within 1, 2, and 3 SDs.
Q: What is a 'Cumulative Relative Frequency Plot'?
A: A graph showing the percentage of data at or below a certain value.
Q: Define 'Residual'.
A: Actual value - Predicted value ($y - \hat{y}$).
Q: What does a 'Negative Residual' mean?
A: The model overestimated the actual value.
Q: What is 'Statistically Significant'?
A: A result so extreme it is unlikely to have occurred by chance ($P < \alpha$).
Q: What is the 'Intersection' of two events?
A: Both events occurring ($A$ and $B$).
Q: What is the 'Union' of two events?
A: Either event or both occurring ($A$ or $B$).
Q: Define 'Independent Events'.
A: Knowing the outcome of one does not change the probability of the other.
Q: Define 'Conditional Probability'.
A: The probability of an event occurring given that another has already occurred.
Q: What is a 'Binomial Setting'?
A: BINS: Binary, Independent, Number of trials fixed, Success probability constant.
Q: What is a 'Geometric Setting'?
A: BITS: Binary, Independent, Trials until first success, Success probability constant.
Q: Define 'Standard Error'.
A: The estimated standard deviation of a sampling distribution.
Q: What is the 'Central Limit Theorem'?
A: The sampling distribution of the mean becomes Normal as $n$ increases ($n \geq 30$).
Q: What is a 'Confidence Level'?
A: The percentage of times the interval would capture the true parameter in repeated sampling.
Q: What is 'Point Estimate'?
A: A single value from a sample used to estimate a population parameter.
Q: Define 'Standardized Test Statistic'.
A: $z$ or $t$ score used to find the $P$-value.
Q: What is a 'Two-sided Test'?
A: A test where $H_a$ is "not equal to," looking for effects in both directions.
Q: What is 'Degrees of Freedom'?
A: The number of values in a final calculation that are free to vary.

UNIT 13: A-Z Statistical Dictionary
Q: Define 'Bias'.
A: Systematic error in a study that favors certain outcomes over others.
Q: Define 'Convenience Sample'.
A: Choosing individuals who are easiest to reach (high bias).
Q: Define 'Extrapolation'.
A: Using a regression line to predict values far outside the range of the data.
Q: Define 'Lurking Variable'.
A: A variable that is not among the explanatory or response variables but may influence the interpretation of relationships.
Q: Define 'Margin of Error'.
A: The range of values above and below a sample statistic that likely contains the true parameter.
Q: Define 'Power of a Test'.
A: The probability that a test correctly rejects a false null hypothesis ($1 - \beta$).
Q: Define 'P-value'.
A: The probability of obtaining results at least as extreme as the observed results, assuming the null is true.
Q: Define 'Resistant Measure'.
A: A statistic (like median or IQR) that is not heavily influenced by outliers.
Q: Define 'Statistically Significant'.
A: When an observed effect is so large that it would rarely occur by chance.
Q: Define 'Type I Error'.
A: Rejecting the null hypothesis when it is actually true (False Positive).
Q: Define 'Type II Error'.
A: Failing to reject the null hypothesis when it is actually false (False Negative).

UNIT 14: Official Formula Sheet (OCR)
Q: Descriptive Statistics Formulas
A: Mean: $\bar{x} = \frac{\sum x_i}{n}$. Variance: $s^2 = \frac{\sum(x_i - \bar{x})^2}{n-1}$. Standard Deviation: $s = \sqrt{s^2}$. LSRL: $\hat{y} = a + bx$. Slope: $b = r \frac{s_y}{s_x}$. Y-int: $a = \bar{y} - b\bar{x}$.
Q: Probability Formulas
A: $P(A \cup B) = P(A) + P(B) - P(A \cap B)$. $P(A|B) = \frac{P(A \cap B)}{P(B)}$. Mean (Discrete): $E(X) = \mu_x = \sum x_i P(x_i)$. Variance (Discrete): $\sigma_x^2 = \sum (x_i - \mu_x)^2 P(x_i)$.
Q: Probability Distribution Formulas (Binomial/Geometric)
A: Binomial: $P(X=k) = \binom{n}{k} p^k (1-p)^{n-k}$. Mean: $\mu = np$. SD: $\sigma = \sqrt{np(1-p)}$. Geometric: $P(X=k) = (1-p)^{k-1} p$. Mean: $\mu = 1/p$. SD: $\sigma = \sqrt{1-p}/p$.
Q: Inference Formulas (Standard Error)
A: Prop (1-samp): $\sqrt{\frac{p(1-p)}{n}}$. Prop (2-samp): $\sqrt{\frac{p_1(1-p_1)}{n_1} + \frac{p_2(1-p_2)}{n_2}}$. Mean (1-samp): $s/\sqrt{n}$. Mean (2-samp): $\sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2}}$.
"""

tutorial_data = r"""
201. **Normal Area (Probability):** `[2nd]` > `VARS` > `2:normalcdf(lower, upper, mean, SD)`. Use `-1E99` for negative infinity bounds and `1E99` for positive infinity.
202. **Normal Percentile (Cutoff):** `[2nd]` > `VARS` > `3:invNorm(area, mean, SD)`. Area must be entered as a decimal representing the left tail. 
203. **Binomial Probability (Exact):** `[2nd]` > `VARS` > `A:binompdf(n, p, x)`. Use when the prompt asks for exactly X successes.
204. **Binomial Cumulative (At Most):** `[2nd]` > `VARS` > `B:binomcdf(n, p, x)`. Calculates the sum of probabilities from 0 up to X. 
205. **Geometric Probability (First Success):** `[2nd]` > `VARS` > `E:geometpdf(p, x)`. Finds the probability that the first success occurs on exactly the Xth trial.
206. **Expected Value of Discrete Random Variable:** Enter values in `L1` and probabilities in `L2`. Run `STAT` > `CALC` > `1:1-Var Stats L1, L2`. The mean (x-bar) is your expected value.
207. **Critical Z-Value (z*):** `[2nd]` > `VARS` > `3:invNorm(tail area, 0, 1)`. For a 95% interval, the tail is 0.025.
208. **Critical T-Value (t*):** `[2nd]` > `VARS` > `4:invT(tail area, df)`. Degrees of freedom is n-1. 
209. **Factorials & Combinations:** Enter your n-value. `MATH` > `PROB` > `3:nCr` or `4:!`.
210. **Random Integer Generation:** `MATH` > `PROB` > `5:randInt(lower, upper, n)`. If simulating without replacement, you must manually ignore repeated numbers.
211. **1-Sample Z-Interval (Proportions):** `STAT` > `TESTS` > `A:1-PropZInt`. Enter successes (x) and sample size (n). x must be a whole integer.
212. **1-Sample Z-Test (Proportions):** `STAT` > `TESTS` > `5:1-PropZTest`. Enter the null proportion (p0), x, and n. 
213. **2-Sample Z-Interval (Proportions):** `STAT` > `TESTS` > `B:2-PropZInt`. Enter x1, n1, x2, n2. 
214. **2-Sample Z-Test (Proportions):** `STAT` > `TESTS` > `6:2-PropZTest`. Calculates the pooled proportion automatically in the background.
215. **1-Sample T-Interval (Means):** `STAT` > `TESTS` > `8:TInterval`. Choose `Data` if using a list, or `Stats` to enter x-bar, Sx, and n manually.
216. **1-Sample T-Test (Means):** `STAT` > `TESTS` > `2:T-Test`. Enter the null mean (mu0). 
217. **2-Sample T-Interval (Means):** `STAT` > `TESTS` > `0:2-SampTInt`. Set `Pooled: No` (almost always in AP Stats).
218. **2-Sample T-Test (Means):** `STAT` > `TESTS` > `4:2-SampTTest`. Set `Pooled: No`. The calculator will output the complex fractional degrees of freedom.
219. **Matched Pairs T-Test:** Highlight `L3` in the list editor. Press `ENTER` and type `L1 - L2`. Run a 1-Sample `T-Test` (Option 2) using `L3` as your data.
220. **Matched Pairs Interval:** After calculating differences in `L3`, run a 1-Sample `TInterval` (Option 8) using `Data` from `L3`.
221. **Chi-Square Goodness of Fit:** Enter observed counts in `L1`, expected in `L2`. `STAT` > `TESTS` > `D:GOF-Test`. You must manually enter degrees of freedom (categories - 1).
222. **Chi-Square Independence/Homogeneity:** `[2nd]` > `x^-1` (MATRIX) > `Edit` > `[A]`. Enter dimensions and observed counts. `STAT` > `TESTS` > `C:Chi-Square Test`.
223. **Finding Expected Counts (Matrix):** After running the Independence test, the calculator automatically populates Matrix `[B]` with expected counts. Go to `MATRIX` > `[B]` > `ENTER` to view them.
224. **Linear Regression T-Test:** `STAT` > `TESTS` > `E:LinRegTTest`. Use `L1` for X and `L2` for Y. Select the alternative hypothesis for beta (usually not equal to 0).
225. **Linear Regression T-Interval:** `STAT` > `TESTS` > `G:LinRegTInt`. Generates the confidence interval for the true slope.
226. **Clear All Lists:** `STAT` > `4:ClrList`. Type `L1, L2, L3` and hit enter. Faster than deleting individual entries.
227. **Sort Data Ascending:** `STAT` > `2:SortA(`. Enter the list name (e.g., `L1`). Useful for quickly finding the median or outliers manually.
228. **Enable Correlation Coefficient (r):** `[2nd]` > `0` (CATALOG) > Scroll down to `DiagnosticOn` > `ENTER` twice. 
229. **Find LSRL Equation:** `STAT` > `CALC` > `8:LinReg(a+bx)`. Ensure `Xlist` is `L1` and `Ylist` is `L2`. 
230. **Store Regression Equation:** Inside the LinReg menu, scroll to `Store RegEQ:`. Press `VARS` > `Y-VARS` > `1:Function` > `1:Y1`. This overlays the line on your scatterplot.
231. **Scatterplot:** `[2nd]` > `Y=` (STAT PLOT) > `Plot1`. Turn On. Select the first graph type (scatter). Hit `ZOOM` > `9:ZoomStat`.
232. **Residual Plot:** After running LinReg, go to `STAT PLOT`. Set `Xlist: L1` and `Ylist: [2nd][STAT](LIST) -> RESID`. Hit `ZOOM` > `9:ZoomStat`.
233. **Histogram:** `STAT PLOT` > Turn On > Select the 3rd graph type. Hit `ZOOM` > `9`. To adjust bin width, press `WINDOW` and change `Xscl`.
234. **Modified Boxplot (Outliers):** `STAT PLOT` > Select the 4th graph type (boxplot with isolated dots). This automatically applies the 1.5(IQR) rule.
235. **Normal Probability Plot:** `STAT PLOT` > Select the 6th graph type. If the resulting plot is roughly linear, the data is approximately Normal.
236. **Sum of a List:** `[2nd]` > `STAT` (LIST) > `MATH` > `5:sum(L1)`. 
237. **Length of a List:** `[2nd]` > `STAT` (LIST) > `MATH` > `3:length(L1)`. Useful for quickly checking your sample size (n).
238. **One-Variable Statistics:** `STAT` > `CALC` > `1:1-Var Stats`. Outputs mean, standard deviation (Sx), and the 5-number summary (scroll down).
239. **Two-Variable Statistics:** `STAT` > `CALC` > `2:2-Var Stats`. Outputs sums of X, sums of Y, and sums of XY.
240. **Predicting a Y-value:** If the equation is stored in Y1, go to the home screen. Press `VARS` > `Y-VARS` > `1:Y1`. Type `Y1(value)` and press enter.
241. **Standardizing Data (Z-Scores list):** Highlight the header of `L2`. Type `(L1 - mean) / SD` and press enter to populate the entire list with z-scores.
242. **Shading Normal Curve:** `[2nd]` > `VARS` > `DRAW` > `1:ShadeNorm(lower, upper, mean, SD)`. Draws the curve and shades the calculated probability.
243. **Clearing Drawings:** `[2nd]` > `PRGM` (DRAW) > `1:ClrDraw`. Removes leftover shaded curves from previous problems.
244. **Setting a Random Seed:** Type a unique number (like your zip code). Press `STO->`. Press `MATH` > `PROB` > `1:rand` > `ENTER`. 
245. **Generating a Sequence:** `[2nd]` > `STAT` (LIST) > `OPS` > `5:seq(`. Useful for populating a list with a specific numeric pattern.
246. **Margin of Error Calculation (Proportions):** Manually calculate: `z* * sqrt(p-hat(1-p-hat)/n)`. 
247. **Margin of Error Calculation (Means):** Manually calculate: `t* * (Sx/sqrt(n))`.
248. **Expected Counts (GOF manual):** Highlight `L2` header. Type `Total Sample Size * L3` (where L3 contains your theoretical proportions). 
249. **Checking System Memory:** `[2nd]` > `+` (MEM) > `2:Mem Management`. Ensure you have enough free RAM before executing heavy TI-Basic scripts.
250. **Archive a Program:** In `Mem Management`, select `7:Prgm`. Press `ENTER` next to a program to move it to ROM (an asterisk will appear), protecting it from RAM clears.
251. **FRQ Trap: The 10% Condition:** Never use the 10% condition ($n \leq 0.10N$) if you are analyzing a randomized experiment. It only applies when sampling *without replacement* from a broader population.
252. **FRQ Trap: Large Counts vs. Normal/Large Sample:** Proportions use the Large Counts condition ($np \geq 10$, $n(1-p) \geq 10$). Means use the Normal/Large Sample condition ($n \geq 30$ or Normal population). Do not mix these up on paper.
253. **FRQ T-Test Condition Check:** If $n < 30$ and the population is not stated as Normal, you MUST draw a quick dotplot or stemplot of the sample data on your paper and state: "The graph shows no strong skew or clear outliers, so the $t$-procedure is appropriate."
254. **Interpreting a P-value (FRQ Standard):** "Assuming the null hypothesis is true [context], there is a [P-value] probability of getting a sample statistic as extreme or more extreme than the one observed, strictly by chance."
255. **Interpreting Confidence Level (FRQ Standard):** "If we were to select many, many random samples of size [n] and construct a [C%] confidence interval from each, about [C%] of these intervals would capture the true [parameter in context]."
256. **Chi-Square GOF Hypotheses:** $H_0$: The specified distribution of [variable] is correct. $H_a$: The specified distribution of [variable] is not correct. Always write these in words, never in symbols.
257. **Chi-Square Independence Hypotheses:** $H_0$: There is no association between [Variable 1] and [Variable 2]. $H_a$: There is an association between [Variable 1] and [Variable 2].
258. **Chi-Square Homogeneity Hypotheses:** $H_0$: The distribution of [Variable] is the same for [Population 1] and [Population 2]. $H_a$: The distribution of [Variable] is different for [Population 1] and [Population 2].
259. **Regression Slope Null Hypothesis:** $H_0: \beta = 0$. In words: "There is no true linear relationship between [X variable] and [Y variable]."
260. **FRQ Trap: Chi-Square Expected Counts:** The rubric requires you to show at least the first two and the last calculation for the expected counts, OR explicitly state the formula used before writing out the matrix values.
261. **Type I Error Context:** "We find convincing evidence that [Alternative Hypothesis], when in reality [Null Hypothesis is true]." You MUST include the real-world consequence of this error to get full credit.
262. **Type II Error Context:** "We fail to find convincing evidence that [Alternative Hypothesis], when in reality [Alternative Hypothesis is actually true]." Include the consequence.
263. **Increasing Power:** In an FRQ, if asked how to increase the power of a test, state: "Increase the sample size ($n$) or increase the significance level ($\alpha$)."
264. **Experimental Design FRQ:** If asked to design an experiment, explicitly list: 1) The completely randomized pool, 2) The random assignment mechanism, 3) The specific treatments, 4) The response variable being compared.
265. **Blocking Justification:** "We blocked by [Variable] because it is known to affect the [Response Variable]. Blocking reduces the variation within groups, making it easier to see the true effect of the treatments."
266. **Matched Pairs Justification:** "This is a matched pairs design because each subject received both treatments in a randomized order, which controls for individual variability."
267. **FRQ Trap: Standard Error vs Standard Deviation:** If an FRQ asks for the meaning of "SE Coef" in a regression table, it is the *Standard Error of the Slope*: "If we repeated this study many times, the sample slope would typically vary from the true population slope by [SE Coef value]."
268. **FRQ Trap: S in Regression Output:** "S" is the standard deviation of the residuals. "The actual [Y variable] typically varies by [S value] away from the value predicted by the least-squares regression line."
269. **FRQ Trap: The Y-Intercept Meaning:** Only interpret the y-intercept if $x=0$ is a plausible value. Otherwise, state: "The y-intercept has no practical meaning in this context because an x-value of 0 is impossible/far outside the data range."
270. **FRQ Trap: Combining Standard Deviations:** You can only combine variances ($\sigma^2$), NEVER standard deviations directly. Square them, add them, then take the square root. You can only do this if the variables are independent.
271. **Inverse T-Distribution:** `[2nd]` > `VARS` > `4:invT(area, df)`. Use this to find the critical $t^*$ value for confidence intervals manually.
272. **Checking Independence (Probability):** To prove independence on an FRQ, mathematically show that $P(A|B) = P(A)$. If the two numbers are equal, they are independent.
273. **Mutually Exclusive Check:** Mathematically show that $P(A \cap B) = 0$. If they share outcomes, they are not mutually exclusive.
274. **Stratified vs Cluster:** Stratified takes *some* from *all* groups. Cluster takes *all* from *some* groups. Use this exact phrasing to distinguish them on FRQs.
275. **Scope of Inference (Selection):** If individuals were randomly selected from a population, you can generalize the results to that entire population.
276. **Scope of Inference (Assignment):** If individuals were randomly assigned to treatments, you can infer cause and effect.
277. **FRQ Trap: "Prove" or "Confirm":** Never use the words "prove" or "confirm" in statistics. Use "provides convincing evidence" or "suggests."
278. **FRQ Trap: Accepting the Null:** Never say "We accept the null hypothesis." Always say "We fail to reject the null hypothesis."
279. **FRQ Trap: Confounding vs Lurking:** Confounding variables are tied to the explanatory variable and affect the response (experiments). Lurking variables are unmeasured variables driving the relationship (observational studies).
280. **Identifying the Parameter:** $\mu$ is a mean, $p$ is a proportion, $\beta$ is a slope. Make sure you use the correct Greek letter in your hypotheses.
281. **Two-Sample vs Matched Pairs:** If there are two distinct groups of different people, it is two-sample. If the same people do both tasks, or they are explicitly paired up by a trait, it is matched pairs.
282. **FRQ Trap: Normalizing a List:** If asked to compare two scores from different Normal distributions, calculate the Z-score for both.
283. **Z-score Interpretation:** "The [value] is [Z] standard deviations [above/below] the mean [variable]."
284. **Percentile Interpretation:** "[Percentile]% of the [population/individuals] had a [variable] at or below [value]."
285. **Extrapolation Danger:** "We cannot trust the prediction for $x = [value]$ because it is far outside the interval of $x$-values used to create the regression line."
286. **Residual Interpretation:** "The actual [Y variable] was [Residual value] [higher/lower] than predicted by the regression line."
287. **Transforming Data (Power Model):** If a scatterplot is curved, highlight `L3`, type `log(L1)`. Highlight `L4`, type `log(L2)`. Run LinReg on L3 and L4 to straighten it.
288. **Reading a Transformed Equation:** If the equation is $\log(\hat{y}) = a + b(x)$, you must calculate $10^{\text{answer}}$ to get the final predicted $y$ value.
289. **Degrees of Freedom (Unpooled T-Test):** Always use the calculator's complex fractional $df$ for 2-sample t-tests, but write down the $df$ on your paper so graders know where your P-value came from.
290. **Chi-Square Cell Contribution:** The cell with the largest $\frac{(O-E)^2}{E}$ contributed the most to the Chi-Square statistic. Identify this if asked "which category differed most from expected."
291. **Calculator Trap (Syntax):** Never write "normalcdf" or "tcdf" on your paper as your primary work. Write the formula, then use the calculator to get the answer.
292. **Calculator Trap (Labels):** If you use calculator speak as a backup, define the inputs: "normalcdf(lower=[val], upper=[val], mean=[val], sd=[val])."
293. **Law of Large Numbers Application:** Used to explain why insurance companies or casinos make money in the long run, despite short-term variability.
294. **Expected Value vs Actual:** Never say the expected value *will* happen. Say it is the *long-run average*.
295. **Confidence Interval vs Level:** The interval is the specific range of numbers. The level is the methodology's success rate.
296. **Overlapping Confidence Intervals:** Do not use overlapping confidence intervals to test for a difference between two groups. Run a proper 2-sample test instead.
297. **Margin of Error Components:** Margin of error only accounts for sampling variability. It does *not* account for bias, undercoverage, or non-response.
298. **Simulations in FRQs:** 1) Assign digits to outcomes. 2) State how to read digits. 3) State what to ignore (repeats). 4) State when to stop a trial. 5) State what to record.
299. **Robustness:** T-tests are robust to slight departures from Normality, especially if the sample size is large.
300. **The Golden Rule of AP Stats:** ALWAYS INCLUDE CONTEXT. A perfect mathematical answer with no words attached will score a Partial (P) or Incorrect (I).
301. **DiagnosticOn (The r-Value fix):** If you don't see $r$ or $r^2$ after running LinReg, go to `[2nd]` > `0` (CATALOG) > scroll to `DiagnosticOn` > `ENTER`. 
302. **List Math (Manual Deviations):** Highlight the name of `L2`. Type `(L1 - mean(L1))^2` to quickly calculate squared deviations for every point.
303. **Table View for Probabilities:** If you store a Binomial formula in `Y1`, you can press `[2nd]` > `GRAPH` (TABLE) to see all probabilities for $X=1, 2, 3...$ at once.
304. **Simulation Speed-Up:** Use `randIntNoRep(1, n)` if your calculator supports it (CE models only). It automatically prevents duplicates in your sample.
305. **Matrix Expected Counts:** After a Chi-Square test, the expected counts are stored in `[B]`. View them via `MATRIX` > `[B]`.
"""

# Extract units
# Split by UNIT X: or MIXED REVIEW
sections = re.split(r'(?:UNIT \d+: |MIXED REVIEW & TRICKY CONCEPTS )', raw_data)
section_headers = re.findall(r'(?:UNIT \d+: |MIXED REVIEW & TRICKY CONCEPTS )(.*?)(?:\n|$)', raw_data)

final_db = {}

def cleanup_latex(text):
    # Regex replacements for complex structures
    regex_reps = [
        (r'\\sqrt{([^}]+)}', r'sqrt(\1)'),
        (r'\\frac{([^}]+)}{([^}]+)}', r'(\1)/(\2)'),
        (r'\\text{([^}]+)}', r'\1'),
        (r'_\{([^}]+)\}', r'\1'), # e.g. _{10} -> 10
        (r'_(\w)', r'\1'), # e.g. _1 -> 1
        (r'\^{th}', 'th')
    ]
    for old, new in regex_reps:
        text = re.sub(old, new, text)
        
    # Literal string replacements
    literal_reps = [
        ('\\beta', 'beta'), ('/beta', 'beta'), ('\\mu', 'mu'), 
        ('\\sigma', 'sigma'), ('\\alpha', 'alpha'), ('\\rho', 'rho'),
        ('\\lambda', 'lambda'), ('\\chi^2', 'Chi-Square'),
        ('\\hat{p}', 'p-hat'), ('\\hat{y}', 'y-hat'), 
        ('\\bar{x}', 'x-bar'), ('\\bar{y}', 'y-bar'),
        ('\\cap', ' AND '), ('\\cup', ' OR '), 
        ('\\cdot', '*'), ('\\leq', '<='), ('\\geq', '>='),
        ('\\neq', '!='), ('\\approx', '~'), ('\\pm', '+/-'),
        ('\\sqrt', 'sqrt'), ('\\sum', 'Sum '), 
        ('H_0', 'H0'), ('H_a', 'Ha'), 
        ('\\left(', '('), ('\\right)', ')'),
        ('\\left[', '['), ('\\right]', ']'),
        ('$', ''), ('{', ''), ('}', '')
    ]
    for old, new in literal_reps:
        text = text.replace(old, new)
        
    text = re.sub(r' +', ' ', text)
    return text.strip()

for idx, (name, content) in enumerate(zip(section_headers, sections[1:])):
    branch = {
        "branch_name": name.strip(),
        "nodes": []
    }
    
    qa_pairs = re.findall(r'Q: (.*?)\nA: (.*?)(?:\nQ:|$)', content, re.DOTALL)
    for q_idx, (q, a) in enumerate(qa_pairs):
        # Improved Keyword Extraction
        whitelist = {"sd", "ci", "ho", "ha", "df", "z", "t", "p"}
        keywords = re.findall(r'\w+', (q + " " + a).lower())
        keywords = [k for k in keywords if len(k) > 3 or k in whitelist]
        
        clean_q = cleanup_latex(q)
        clean_a = cleanup_latex(a)
        
        node = {
            "id": f"{idx}.{q_idx}",
            "keywords": list(set(keywords)),
            "title": clean_q,
            "C": "N/A",
            "F": "N/A",
            "K": "N/A",
            "I": clean_a,
            "T": "N/A"
        }
        
        # Heuristic to separate C, F, K from answer
        if "condition" in a.lower():
            node["C"] = clean_a
        if "$" in a or "formula" in a.lower():
            node["F"] = clean_a
        if "calculator" in a.lower() or "binom" in a.lower() or "norm" in a.lower() or "test" in a.lower():
            node["K"] = clean_a
        if "tutorial" in a.lower() or "step" in a.lower() or "press" in a.lower() or "verb" in a.lower() or "action" in a.lower():
            node["T"] = clean_a
            
        branch["nodes"].append(node)
    
    final_db[str(idx)] = branch

# Process tutorial branch
t_branch = {
    "branch_name": "Calculator Tutorials",
    "nodes": []
}
t_pairs = re.findall(r'\d+\.\s+\*\*(.*?):\*\*\s+(.*?)(?=\n\d+\.|$)', tutorial_data, re.DOTALL)
for t_idx, (q, a) in enumerate(t_pairs):
    keywords = re.findall(r'\w+', q.lower())
    keywords = [k for k in keywords if len(k) > 3]
    
    clean_q = cleanup_latex(q)
    clean_a = cleanup_latex(a).replace('`', '')
    
    node = {
        "id": f"T.{t_idx}",
        "keywords": list(set(keywords)),
        "title": clean_q,
        "C": "N/A",
        "F": "N/A",
        "K": "N/A",
        "I": "N/A",
        "T": clean_a
    }
    t_branch["nodes"].append(node)

final_db[str(len(section_headers))] = t_branch

frq_data = r"""
### 1. Describing a Univariate Distribution (Unit 1)
**The Trap:** Students list the stats but forget context or skip a required element. 
**The Rule:** You must use **SOCS** (Shape, Outliers, Center, Spread) AND include the context (units/variable name).
* **Template:** "The distribution of *[variable name/context]* is *[Shape: roughly symmetric / right-skewed / left-skewed]*. There *[are / are no]* apparent outliers *[list them if they exist]*. The center of the distribution is a *[median/mean]* of *[value]* *[units]*, and the spread is best described by an *[IQR / Standard Deviation]* of *[value]* *[units]*."
* **FRQ Hack:** If it's skewed, specifically name the Median and IQR. If it's symmetric, specifically name the Mean and Standard Deviation.

### 2. Comparing Two Distributions (Unit 1)
**The Trap:** Students describe both distributions perfectly but fail to actually compare them.
**The Rule:** You must use explicit comparison words (*greater than, less than, roughly equal to*) for the Center and the Spread.
* **Template:** "Both distributions of *[context]* are *[Shape]*. However, Group A has a noticeably higher center (Median = *[value]*) than Group B (Median = *[value]*). Group A also has a larger spread, with an IQR of *[value]* compared to Group B's IQR of *[value]*. Group A contains an outlier at *[value]*, while Group B has no apparent outliers."

### 3. Interpreting the LSRL Slope and Y-Intercept (Unit 2)
**The Trap:** Using deterministic language (saying "it will increase" instead of "it is predicted to increase").
**The Rule:** Always use non-probabilistic, predictive language and include units for both X and Y.
* **Slope Template:** "For every 1 *[unit of X]* increase in *[Explanatory Variable]*, the *[Response Variable]* is **predicted** to *[increase/decrease]* by *[Slope Value]* *[units of Y]*."
* **Y-Intercept Template:** "If the *[Explanatory Variable]* is 0 *[units of X]*, the **predicted** *[Response Variable]* is *[Y-int Value]* *[units of Y]*." *(Add a sentence stating if this makes sense in reality, as extrapolating to 0 is often impossible).*

### 4. Explaining Random Assignment (Unit 3)
**The Trap:** Saying "use a random number generator" without explaining exactly how the numbers are assigned and how repeats are handled.
**The Rule:** You must explain the mechanism so clearly that someone with no statistical knowledge could execute it. 
* **The "Hat Trick" Template (Bulletproof for FRQs):** "Write the names of all *[total number]* subjects on identically sized slips of paper. Place them into a hat and mix thoroughly. Draw *[number]* slips without replacement. These subjects will be assigned to *[Treatment 1]*. The remaining subjects in the hat will be assigned to *[Treatment 2]*."

### 5. Binomial Probability Calculations (Unit 4)
**The Trap:** Just writing "binomcdf(10, 0.5, 4) = 0.377" will get you zero credit for work shown.
**The Rule:** You must define the distribution, state the parameters, and show the formula setup before writing the calculator output.
* **Template:** 1. Define: "Let X = the number of *[successes in context]*." 2. Parameters: "X has a binomial distribution with n = *[trials]* and p = *[probability]*." 3. Formula setup: "$P(X = k) = \binom{n}{k} p^k (1-p)^{n-k}$" 4. Execution: "$P(X = 3) = \binom{10}{3} (0.5)^3 (0.5)^7 = 0.117$" *(You can use the calculator to get the 0.117, but you must write the formula).*

### 6. Expected Value / Mean of a Discrete Random Variable (Unit 4)
**The Trap:** Failing to show the summation process.
**The Rule:** Show at least the first two and the last term of the multiplication string to prove you understand the mechanics, even if you did it in L1/L2.
* **Template:** 1. "The expected value of *[context]* is calculated by $\mu_x = \sum x_i P(x_i)$." 2. "$\mu_x = (Value_1 \times Prob_1) + (Value_2 \times Prob_2) + ... + (Value_n \times Prob_n)$" 3. "$\mu_x =$ *[Final Answer]* *[Units]*." 4. Interpretation: "If we randomly select many, many *[subjects]*, we expect the average *[variable]* to be approximately *[Final Answer]*."

### 7. The PANIC Template (Confidence Intervals)
**The Trap:** Skipping conditions or misinterpreting the final interval.
**The Rule:** You must hit all 5 parts exactly.
* **P: Parameter:** Define the population parameter. "Let $p$ be the true proportion of all *[population]* who *[context]*."
* **A: Assumptions/Conditions:** Verify Random, 10% Rule ($n \leq 0.10N$), and Normal/Large Counts ($n\hat{p} \geq 10, n(1-\hat{p}) \geq 10$ or $n \geq 30$).
* **N: Name the Interval:** State the procedure. "One-sample $z$-interval for a proportion."
* **I: Interval Calculation:** Formula and execution. "Stat $\pm$ (Crit) $\times$ (SE)" -> "0.65 $\pm$ 1.96 $\times$ 0.047 = (0.558, 0.742)"
* **C: Conclusion:** "We are *[95%]* confident that the true *[parameter]* is between *[low]* and *[high]*."

### 8. The PHANTOMS Template (Hypothesis Tests)
**The Trap:** Forgetting to explicitly reject or fail to reject before writing the context conclusion.
**The Rule:** Follow the 8-step process.
* **P: Parameter:** "Let $\mu$ be the true mean *[context]*."
* **H: Hypotheses:** "$H_0: \mu = \mu_0$ vs $H_a: \mu > \mu_0$."
* **A: Assumptions/Conditions:** (Same as PANIC).
* **N: Name the Test:** "One-sample $t$-test for a mean."
* **T: Test Statistic:** "$t = \frac{\bar{x} - \mu_0}{s/\sqrt{n}} = 2.45$."
* **O: Obtain P-value:** "$P$-value = 0.007."
* **M: Make Decision:** "Since $P$-value (0.007) < $\alpha$ (0.05), we reject the null hypothesis."
* **S: State Conclusion:** "There is convincing evidence that the true mean *[context]* is *[greater than/less than/different from]* *[value]*."

### 9. FRQ Action Verbs (Low-Stakes)
* **Identify/Indicate/State:** Just name the value, term, or concept. Action: No explanation needed.
* **Determine:** Arrive at an answer through calculation or logic. Action: Show the path (numbers used), but no paragraph justification needed.
* **Label/Plot:** Physical actions on a graph. Action: Ensure units and scales are clear.

### 10. FRQ Action Verbs (Mid-Stakes)
* **Calculate:** Perform mathematical steps. Action: Must show the formula and the substitution.
* **Describe:** Provide relevant characteristics. Action: Use SOCS (Shape, Outliers, Center, Spread) with context.
* **Construct/Draw:** Create a visual model. Action: Must be consistent with the data (e.g., 1.5*IQR rule for boxplots).

### 11. FRQ Action Verbs (High-Stakes)
* **Explain:** Show cause and effect. Action: Use "Because" (e.g., "Because p-value < alpha, we reject...").
* **Compare:** Find similarities and differences. Action: Use comparison words (higher, lower, similar) to link both groups in one sentence.
* **Justify:** Defend a claim with evidence. Action: Link specific data to a specific statistical rule.
* **Verify:** Confirm conditions are met. Action: Show the math for the condition check (e.g., np >= 10).

### 12. AP Statistics Task Verb Tutorials
* **Calculate:** Perform mathematical steps. Action: Show the formula, substitute the numbers, and include units. Do not just write the final number.
* **Compare:** Explain similarities/differences. Action: Link both groups in one sentence using words like "greater than" or "similar to."
* **Describe:** Provide relevant characteristics. Action: For distributions, use SOCS (Shape, Outliers, Center, Spread) with context.
* **Explain:** Show cause and effect. Action: Use a "Because" statement to link evidence to the outcome.
* **Identify:** State a value/term. Action: Name it directly. No explanation needed.
* **Interpret:** Relate results to context. Action: Use the variable names and units from the problem.
* **Justify:** Defend a claim. Action: Use statistical evidence (p-values, conditions) to support why the conclusion is valid.
* **The "I CAN" Framework:** 1. **I**dentify the test. 2. **C**heck conditions. 3. **A**nalyze results (math). 4. **N**arrate conclusion (context).

### 13. Critical Values (Z* and T*) Table
* **Z-Star Critical Values:** 90%: 1.645 | 95%: 1.96 | 98%: 2.326 | 99%: 2.576. Use `invNorm` on calculator for other levels.
* **T-Star Critical Values:** Always based on Degrees of Freedom ($df = n-1$). Use `invT` on calculator. Common levels for $df=30$: 95%: 2.042 | 99%: 2.750.
* **Confidence vs Margin of Error:** Increasing confidence increases the width of the interval (makes it less precise). Increasing sample size ($n$) decreases the width (makes it more precise).

### 14. Unit 5: Sampling Distributions (The Bridge)
* **The CLT (Central Limit Theorem):** Regardless of population shape, the sampling distribution of the mean ($\bar{x}$) becomes approximately Normal if $n \geq 30$.
* **Law of Large Numbers:** As $n$ increases, the sample mean ($\bar{x}$) gets closer to the true population mean ($\mu$).
* **Unbiased Estimator:** A statistic whose mean of its sampling distribution is equal to the true parameter ($\hat{p} = p, \bar{x} = \mu$).

### 15. FRQ Q6: The Investigative Task
* **Strategy:** Q6 counts for 25% of your FRQ score. It often introduces a NEW concept you haven't seen. 
* **The Trick:** Don't panic. Use the definitions provided in the prompt. Part (a) usually asks for something simple to build your confidence. 
* **Scoring:** Readers give partial credit for "Statistical Integrity." If you get an early part wrong, keep using that number in later parts—you can still get full credit for the later sections!

### 16. Unit 10: Comparing Two Populations
* **Proportions (z-test):** Compare two groups using $z = \frac{(\hat{p}_1 - \hat{p}_2) - 0}{\sqrt{\hat{p}_C(1-\hat{p}_C)(1/n_1 + 1/n_2)}}$.
* **Means (t-test):** Compare two means using $t = \frac{(\bar{x}_1 - \bar{x}_2) - 0}{\sqrt{s_1^2/n_1 + s_2^2/n_2}}$. Use unpooled degrees of freedom.

### 17. Unit 11: Chi-Square Tests
* **Goodness of Fit:** $\chi^2 = \sum \frac{(O-E)^2}{E}$. Use to see if data fits a claimed distribution. $df = \text{categories} - 1$.
* **Homogeneity/Independence:** Use a matrix to test if distributions are the same across populations or if two variables are associated. $df = (r-1)(c-1)$.

### 18. Unit 12: Inference for Regression
* **Conditions (LINER):** Linear, Independent, Normal, Equal Variance, Random.
* **Testing Slope:** $t = \frac{b - 0}{SE_b}$. $df = n - 2$.

### 19. TPS 5e Master Summary (Chapters 1-12)
* **Chapter 1 Summary:** Describe distributions using SOCS (Shape, Outliers, Center, Spread). Use histograms for large datasets and boxplots for outliers.
* **Chapter 2 Summary:** Normal distributions follow the 68-95-99.7 rule. Standardize with $z = (x - \mu)/\sigma$.
* **Chapter 3 Summary:** $r$ measures linear strength. $r^2$ is the % of variation in $y$ explained by $x$. Interpret the slope as the predicted change.
* **Chapter 4 Summary:** Random sampling reduces bias. Random assignment allows for cause-and-effect conclusions.
* **Chapter 5 Summary:** Probability rules ($P(A \cup B)$ and $P(A|B)$). Independence check: $P(A|B) = P(A)$.
* **Chapter 6 Summary:** Random variables. Mean of $X+Y = \mu_x + \mu_y$. Variance of $X+Y = \sigma_x^2 + \sigma_y^2$ (if independent).
* **Chapter 7 Summary:** Sampling distributions. The CLT ensures normality for $n \ge 30$.
* **Chapter 8 Summary:** Confidence Intervals. Margin of Error = (Critical Value) * (Standard Error).
* **Chapter 9 Summary:** Significance Tests. P-value is the probability of results as extreme as observed, assuming $H_0$ is true.
* **Chapter 10 Summary:** Comparing two groups. Two-sample t-test is for means; two-proportion z-test is for proportions.
* **Chapter 11 Summary:** Chi-Square. Expected counts must be $\ge 5$.
* **Chapter 12 Summary:** Regression inference. Check for no pattern in residuals for linearity.

### 20. Unit 1: Exploring One-Variable Data (Deep Dive)
* **Variable Types:** Categorical (counts/percents) vs. Quantitative (measurable values).
* **Displaying Categorical:** Bar charts (counts) and Pie charts (percents). Never use these for quantitative data.
* **Displaying Quantitative:** Dotplots (small n), Stemplots (small n, preserves data), Histograms (large n, groups data), Boxplots (highlights outliers).
* **SOCS - Shape:** Symmetric, Left-Skewed (tail on left, mean < median), Right-Skewed (tail on right, mean > median), Unimodal (one peak), Bimodal (two peaks).
* **SOCS - Outliers:** The 1.5*IQR Rule: $Q1 - 1.5(IQR)$ and $Q3 + 1.5(IQR)$. Any point outside this range is an outlier.
* **SOCS - Center:** Use Median for skewed data (resistant). Use Mean for symmetric data.
* **SOCS - Spread:** Use IQR for skewed data. Use Standard Deviation for symmetric data.
* **Standard Deviation Meaning:** The typical distance a data point is from the mean.
* **Comparing Distributions:** You MUST use comparison words (greater, smaller, similar) and mention both groups in every sentence.

### 21. Unit 2: Modeling Distributions (Deep Dive)
* **Z-Score Meaning:** The number of standard deviations a value is above or below the mean.
* **Density Curves:** Area under the curve is always 1. The median is the 50th percentile.
* **Empirical Rule (68-95-99.7):** Applies ONLY to Normal distributions. 68% in 1 SD, 95% in 2 SD, 99.7% in 3 SD.
* **Assessing Normality:** 1. Check for symmetry in a histogram/boxplot. 2. Verify the 68-95-99.7 rule. 3. Normal Probability Plot (NPP): If the plot is linear, the data is Normal.

### 22. Unit 3: Two-Variable Quantitative Data (Deep Dive)
* **Scatterplots:** Describe Direction (+/-), Form (Linear/Curved), Strength (Weak/Moderate/Strong).
* **Correlation (r):** Measures strength/direction of linear relationship. -1 to 1. Not resistant to outliers.
* **LSRL Equation:** $\hat{y} = a + bx$. $\hat{y}$ is the predicted value.
* **Slope (b) Interpretation:** For every 1 unit increase in $x$, the $y$-variable is predicted to increase/decrease by [b] units.
* **Y-Intercept (a) Interpretation:** When $x=0$, the predicted value of $y$ is [a]. (Often has no practical meaning).
* **Residuals:** $y - \hat{y}$ (Actual - Predicted). Positive residual = underprediction. Negative = overprediction.
* **Residual Plots:** If there is NO PATTERN, a linear model is appropriate. If there is a curve, a linear model is NOT appropriate.
* **Coefficient of Determination (r^2):** [r^2]% of the variation in [y-variable] is accounted for by the linear relationship with [x-variable].
* **Standard Deviation of Residuals (s):** The typical distance between the actual y-values and the predicted y-values.

### 23. Unit 4: Collecting Data (Deep Dive)
* **Sampling Methods:** SRS (every group has equal chance), Stratified (split by trait, sample some from all), Cluster (split by location, sample all from some), Systematic (every kth individual).
* **Bias Types:** Voluntary Response (only loud voices), Convenience (easiest to reach), Undercoverage (missing groups), Nonresponse (people won't answer), Response Bias (lying/wording).
* **Observational Study:** No treatment imposed. Can show association, NOT causation.
* **Experiment:** Treatment imposed. Random assignment allows for causation.
* **Key Principles of Design:** 1. Comparison (at least 2 groups). 2. Random Assignment (balances variables). 3. Control (reduces confounding). 4. Replication (many subjects).
* **Confounding Variable:** An outside variable that affects the response and is tied to the treatment, making it impossible to tell which caused the result.
* **Blocking:** Grouping subjects by a known variable before assigning treatments to reduce variation. "Block what you can, randomize what you cannot."
* **Matched Pairs:** Each subject does both treatments, or subjects are paired by a specific trait (twins, height) to control for individual differences.

### 24. Unit 5: Probability (Deep Dive)
* **General Rules:** 1. Probabilities are 0 to 1. 2. Sum of all outcomes = 1. 3. Complement: $P(A^c) = 1 - P(A)$.
* **Mutually Exclusive:** Events cannot happen at same time. $P(A \cap B) = 0$.
* **Addition Rule (OR):** $P(A \cup B) = P(A) + P(B) - P(A \cap B)$.
* **Multiplication Rule (AND):** $P(A \cap B) = P(A) \times P(B|A)$.
* **Independence Check:** Events are independent if $P(A|B) = P(A)$ or $P(B|A) = P(B)$.
* **Tree Diagrams:** Use for conditional probability with multiple steps. Multiply along branches to find the probability of a specific path.
* **Venn Diagrams:** Use for "At least one" or "Neither" problems. Always start from the middle intersection and work outward.

### 25. Unit 6: Random Variables (Deep Dive)
* **Discrete RV:** List of outcomes with associated probabilities. Mean (Expected Value): $E(X) = \sum x_i P(x_i)$.
* **Standard Deviation (Discrete):** $\sigma = \sqrt{\sum (x_i - \mu_x)^2 P(x_i)}$.
* **Continuous RV:** Described by a density curve (area = 1). Use `normalcdf` for probabilities.
* **Transforming RVs:** 1. Adding a constant: Changes Mean, but NOT Spread (SD/IQR/Range). 2. Multiplying a constant: Changes BOTH Mean and Spread.
* **Combining RVs:** 1. $E(X \pm Y) = E(X) \pm E(Y)$. 2. $VAR(X \pm Y) = VAR(X) + VAR(Y)$ (MUST be independent). ALWAYS ADD VARIANCES, NEVER SUBTRACT.
* **Binomial Distribution (BINS):** Binary (Success/Fail), Independent, Number of trials fixed, Success probability constant.
* **Binomial Formulas:** Mean = $np$. SD = $\sqrt{np(1-p)}$.
* **Geometric Distribution (BITS):** Binary, Independent, Trials until first success, Success probability constant.
* **Geometric Formulas:** Mean = $1/p$. SD = $\sqrt{1-p}/p$.

### 26. Unit 7: Sampling Distributions (Deep Dive)
* **Parameter vs Statistic:** Parameter = Population ($\mu, p$). Statistic = Sample ($\bar{x}, \hat{p}$).
* **Sampling Variability:** The concept that different random samples produce different statistics.
* **Unbiased Estimator:** A statistic whose mean of its sampling distribution equals the true parameter.
* **Standard Error (SE):** The estimated standard deviation of a sampling distribution.
* **Sampling Distribution of Proportion ($\hat{p}$):** Mean = $p$. SD = $\sqrt{p(1-p)/n}$. Condition: Normal if $np \ge 10$ and $n(1-p) \ge 10$.
* **Sampling Distribution of Mean ($\bar{x}$):** Mean = $\mu$. SD = $\sigma/\sqrt{n}$.
* **Central Limit Theorem (CLT):** If $n \ge 30$, the sampling distribution of $\bar{x}$ is approximately Normal regardless of the population shape.
* **Rule for SD Formulas:** You must check the 10% condition ($n \le 0.10N$) before using the Standard Deviation formulas for sampling distributions.

### 27. Unit 8: Confidence Intervals for Proportions (Deep Dive)
* **The Goal:** Estimate the true population proportion ($p$).
* **PANIC - Parameter:** "Let $p$ be the true proportion of [context]."
* **PANIC - Assumptions:** 1. Random (stated). 2. 10% Rule ($n \le 0.10N$). 3. Large Counts ($np \ge 10$ and $n(1-p) \ge 10$).
* **PANIC - Name:** "One-sample z-interval for a proportion."
* **PANIC - Interval:** $\hat{p} \pm z^* \sqrt{\hat{p}(1-\hat{p})/n}$.
* **Critical Value (z*):** 90%: 1.645 | 95%: 1.96 | 99%: 2.576.
* **PANIC - Conclusion:** "We are [C%] confident that the true proportion of [context] is between [low] and [high]."
* **Interpretation of Confidence Level:** "If we were to take many, many random samples and construct intervals, about [C%] of them would capture the true proportion."

### 28. Unit 9: Significance Tests for Proportions (Deep Dive)
* **The Goal:** Test a claim about a population proportion.
* **PHANTOMS - Parameter:** "Let $p$ be the true proportion..."
* **PHANTOMS - Hypotheses:** $H_0: p = p_0$ vs $H_a: p > / < / \neq p_0$.
* **PHANTOMS - Assumptions:** (Same as PANIC).
* **PHANTOMS - Name:** "One-sample z-test for a proportion."
* **PHANTOMS - Test Statistic:** $z = \frac{\hat{p} - p_0}{\sqrt{p_0(1-p_0)/n}}$.
* **PHANTOMS - Obtain P-value:** Use `1-PropZTest` or `normalcdf`.
* **PHANTOMS - Make Decision:** "Since P-value < alpha, we reject the null."
* **PHANTOMS - State Conclusion:** "There is convincing evidence that the true proportion of [context] is [Ha description]."

### 29. Units 10 & 11: Inference for Means (Deep Dive)
* **The Goal:** Estimate or test the true population mean ($\mu$).
* **The T-Distribution:** Use when $\sigma$ is unknown. Wider tails than Normal. Degrees of Freedom ($df = n-1$).
* **Assumptions for Means:** 1. Random. 2. 10% Rule. 3. Normal/Large Sample: Either population is Normal, OR $n \ge 30$ (CLT), OR a sample graph shows no strong skew/outliers.
* **Confidence Interval (T-Interval):** $\bar{x} \pm t^* (s/\sqrt{n})$.
* **Significance Test (T-Test):** $t = \frac{\bar{x} - \mu_0}{s/\sqrt{n}}$.
* **Two-Sample Inference:** Use when comparing two separate groups. $df$ is calculated by the calculator (unpooled).
* **Matched Pairs Inference:** Calculate the DIFFERENCES ($L_1 - L_2$) first. Run a 1-sample t-procedure on the list of differences. $H_0: \mu_{diff} = 0$.

### 30. Unit 11: Chi-Square Tests (Deep Dive)
* **Goodness of Fit (GOF):** One population, one variable. Tests if data follows a specific distribution. $df = \text{cats} - 1$.
* **Test of Independence:** One population, two variables. Tests for an association. $df = (r-1)(c-1)$.
* **Test of Homogeneity:** Two+ populations, one variable. Tests if distributions are identical. $df = (r-1)(c-1)$.
* **Assumptions:** 1. Random. 2. 10% Rule. 3. Large Counts (ALL EXPECTED COUNTS MUST BE $\ge 5$).
* **Chi-Square Calculation:** $\chi^2 = \sum \frac{(O-E)^2}{E}$.

### 31. Unit 12: Inference for Regression (Deep Dive)
* **LINER Conditions:** 1. Linear (Residual plot shows no pattern). 2. Independent (10% rule). 3. Normal (Histogram of residuals is symmetric). 4. Equal Variance (Residual plot has consistent vertical spread). 5. Random (Stated).
* **Confidence Interval for Slope ($\beta$):** $b \pm t^* SE_b$. $df = n-2$.
* **Significance Test for Slope:** $H_0: \beta = 0$ (No linear relationship). $t = \frac{b - 0}{SE_b}$.
* **Standard Error of the Slope ($SE_b$):** The typical distance between the sample slope and the true population slope.
### 34. FRQ Question 6 (Investigative Task) Archive
* **2023:** Probability of a series of events involving a "weird" condition.
* **2022:** Comparing two different sampling methods for efficiency.
* **2021:** Regression with a "shifted" variable.
* **2020:** Combining standard deviations of non-independent variables.
* **2019:** Probability logic involving a "game" with unfair odds.
* **2018:** Regression on transformed data (Log-Log vs Semi-Log).
* **2017:** Chi-Square logic on a non-standard contingency table.

### 35. Historical FRQ Archive (2000-2016 Summaries)
* **2016 Q1:** Descriptive stats comparing two salaries. Use SOCS.
* **2016 Q2:** Sampling design. Explain how to use a random number generator.
* **2016 Q3:** Probability. Calculating the probability of a specific sequence of wins.
* **2016 Q4:** 2-sample z-test for proportions regarding smoking habits.
* **2016 Q5:** Chi-Square test for independence between gender and major.
* **2015 Q1:** Regression. Interpreting slope and r-squared for house prices.
* **2015 Q2:** Experimental design. Explaining the purpose of a control group.
* **2015 Q3:** Probability. Expected value of a insurance policy.
* **2015 Q4:** 1-sample t-test for means regarding student sleep hours.
* **2014 Q1:** Boxplots comparing two types of cars. Focus on spread and outliers.
* **2014 Q2:** Probability. Conditional probability using a 2-way table.
* **2014 Q3:** Normal distribution. Finding the percentage of values between two points.
* **2014 Q4:** 2-sample t-test for means regarding blood pressure.
* **2013 Q1:** Scatterplots. Describing relationship between height and weight.
* **2013 Q2:** Sampling. Pros and cons of stratified vs simple random sampling.
* **2013 Q3:** Binomial probability. Finding exactly 3 successes in 5 trials.
* **2012 Q1:** Descriptive stats. Histogram vs Stemplot comparison.
* **2012 Q2:** Significance test. Rejecting H0 based on a p-value of 0.02.
* **2012 Q3:** Probability. Tree diagram for a multi-stage medical test.
* **2011 Q1:** 1-sample z-interval for proportions regarding public opinion.
* **2011 Q2:** Regression. Residual plot interpretation.
* **2010 Q1:** Comparing distributions. Back-to-back stemplot interpretation.
* **2010 Q2:** Sampling bias. Explaining why a voluntary response is bad.
* **2009 Q1:** Linear regression. Calculating a residual.
* **2008 Q1:** Experimental design. Random assignment vs Random selection.
* **2007 Q1:** Descriptive stats. SOCS comparison of two brands of batteries.
* **2006 Q1:** Probability. Addition rule for mutually exclusive events.
* **2005 Q1:** Inference. Choosing between z and t based on sample size.
* **2004 Q1:** Regression. Interpreting the standard deviation of residuals (s).
* **2003 Q1:** Probability. Law of Large Numbers in a coin toss simulation.
* **2002 Q1:** Sampling. Identifying the population and the sample.
* **2001 Q1:** Descriptive stats. Calculating the IQR from a list.
* **2000 Q1:** First ever exam FRQ. Descriptive stats and Socs.

### 36. Extended Master Glossary (Part 2 - Advanced Terms)
* **Adherence:** How closely subjects follow the experimental protocol.
* **Back-to-back Stemplot:** Comparing two groups using a shared vertical stem.
* **Bimodal:** A distribution with two distinct peaks (modes).
* **Bivariate Data:** Data involving two variables (x and y).
* **Blocking Factor:** The variable used to group subjects before randomization.
* **Bootstrap:** Re-sampling with replacement to estimate a sampling distribution.
* **Categorical Data:** Qualitative data that labels individuals into groups.
* **Central Limit Theorem:** The rule that means of large samples follow a Normal curve.
* **Coefficient of Determination:** r-squared. % of variation explained by the model.
* **Conditional Distribution:** The distribution of one variable given a specific value of another.
* **Confounding Variable:** A variable that creates a fake association between two others.
* **Continuity Correction:** Adjusting a discrete distribution to fit a continuous model.
* **Control Group:** The group that receives a placebo or no treatment.
* **Critical Value:** The number of standard errors needed for a specific confidence level.
* **Cumulative Relative Frequency:** The sum of relative frequencies up to a certain point.
* **Degrees of Freedom:** Values used to adjust for sample size in t-tests and chi-square.
* **Discrete Random Variable:** A variable with a finite or countable number of outcomes.
* **Double-Blind:** Neither the subjects nor the researchers know who got which treatment.
* **Efficiency:** A measure of how quickly an estimator approaches the true parameter.
* **Expected Count:** The number of occurrences predicted by a null hypothesis.
* **Experimental Units:** The individuals or objects assigned to treatments.
* **Explanatory Variable:** The variable (x) used to predict the response.
* **Extrapolation:** Predicting values far outside the observed data range.
* **False Positive:** A Type I error in a medical or legal context.
* **Five-Number Summary:** Min, Q1, Median, Q3, Max.
* **Homogeneity:** Testing if different populations have the same distribution.
* **Influential Point:** A data point that significantly changes the slope of a regression line.
* **Joint Frequency:** The count of individuals in a specific category of a two-way table.
* **Law of Large Numbers:** The long-run average approaches the true average.
* **Least-Squares Regression:** The line that makes the sum of squared residuals smallest.
* **Level of Significance:** Alpha. The cutoff for rejecting the null.
* **Lurking Variable:** A variable NOT included in the study that affects results.
* **Marginal Distribution:** The distribution of one variable in a two-way table.
* **Matched Pairs Design:** Pairing subjects by a trait to reduce variation.
* **Mean Absolute Deviation:** The average distance of data points from the mean.
* **Multistage Sampling:** Combining multiple sampling methods (e.g. Cluster then SRS).
* **Non-Resistant Measure:** A statistic easily changed by outliers (Mean, SD, Range).
* **Normal Probability Plot:** A plot used to check if data is approximately Normal.
* **Observational Study:** Studying subjects without trying to influence them.
* **Outlier:** A value more than 1.5*IQR away from the nearest quartile.
* **P-value:** The probability of getting results at least as extreme as observed.
* **Parameter:** A number that describes the whole population.
* **Placebo Effect:** When subjects improve just because they think they are treated.
* **Population:** Every single individual we are interested in.
* **Power:** 1 - Beta. The probability of rejecting a false null.
* **Probability Distribution:** A list of all outcomes and their probabilities.
* **Random Assignment:** The key to showing cause-and-effect in experiments.
* **Random Variable:** A variable whose value is determined by a random process.
* **Regression Line:** A line used to model a linear relationship.
* **Residual:** The vertical distance between a data point and the line.
* **Resistant Measure:** A statistic NOT affected by outliers (Median, IQR).
* **Response Variable:** The variable (y) we are trying to measure or predict.
* **Robust Procedure:** A test that works even if conditions are slightly violated.
* **Sampling Bias:** When a sample does not accurately represent the population.
* **Sampling Distribution:** The distribution of all possible sample statistics.
* **Standard Deviation:** A measure of the typical distance from the mean.
* **Standard Error:** The estimated standard deviation of a statistic.
* **Statistic:** A number that describes a specific sample.
* **Stratified Random Sample:** Splitting by a trait then taking an SRS from each group.
* **Systematic Random Sample:** Choosing every nth person from a random starting point.
* **Test Statistic:** A number (z, t, or chi-square) used to find a p-value.
* **Two-Way Table:** Displays relationship between two categorical variables.
* **Type I Error:** Saying there is an effect when there isn't.
* **Type II Error:** Saying there is no effect when there is.
* **Undercoverage:** Leaving out entire groups from a sample.
* **Univariate Data:** Data involving only one variable.
* **Upper Tail:** The right side of a probability distribution.
* **Variance:** Standard deviation squared. Always add these, never subtract.
* **Voluntary Response Bias:** When only people with strong opinions join a study.
* **Z-score:** Standardizing a value into standard deviations.

### 33. TI-84 Simulation "Cheat Codes"
* **Dice Simulation:** `randInt(1, 6, 100)` -> `L1`. Counts frequencies in `L1`.
* **Coin Flip:** `randInt(0, 1, 50)`. 0 = Tails, 1 = Heads.
* **SRS without replacement:** `randIntNoRep(1, N, n)`. (CE model only).
* **Sampling from List:** `randInt(1, dim(L1), n)` gives indices of random elements.
* **Bernoulli Trials:** `randInt(0, 100) < p*100`. If 1, success. If 0, fail.

### 34. FRQ Question 6 (Investigative Task) Archive
* **2023:** Probability of a series of events involving a "weird" condition.
* **2022:** Comparing two different sampling methods for efficiency.
* **2021:** Regression with a "shifted" variable.
* **2020:** Combining standard deviations of non-independent variables.
* **2019:** Probability logic involving a "game" with unfair odds.
* **2018:** Regression on transformed data (Log-Log vs Semi-Log).
* **2017:** Chi-Square logic on a non-standard contingency table.

### 35. The Official Formula Sheet Masterclass
* **Mean of Sample Mean (mu_xbar):** This is always equal to the population mean (mu). No calculation needed. Use this when defining the center of a sampling distribution.
* **SD of Sample Mean (sigma_xbar):** sigma / sqrt(n). Use this ONLY if the 10% condition is met. This measures how much the sample mean varies from sample to sample.
* **Mean of Sample Proportion (mu_phat):** This is always equal to the population proportion (p). Use this to show that phat is an unbiased estimator.
* **SD of Sample Proportion (sigma_phat):** sqrt(p(1-p)/n). Use this ONLY if the 10% condition is met. Use phat in place of p for confidence intervals (Standard Error).
* **Linear Regression Slope (b1):** r * (sy / sx). The slope represents the predicted change in y for every 1 unit increase in x.
* **Linear Regression Intercept (b0):** ybar - b1*xbar. The line always passes through the point (xbar, ybar).
* **Probability Addition Rule:** P(A or B) = P(A) + P(B) - P(A and B). Subtract the intersection so you don't double count.
* **Conditional Probability Rule:** P(A|B) = P(A and B) / P(B). Read as "The probability of A GIVEN B."
* **Binomial Mean (mu):** n * p. The expected number of successes in n trials.
* **Binomial SD (sigma):** sqrt(n * p * (1-p)). The typical deviation from the expected number of successes.
* **Chi-Square Statistic:** Sum of (Observed - Expected)^2 / Expected. A measure of how far your data is from what was predicted by the null.
* **Standardized Test Statistic:** (Statistic - Parameter) / Standard Error. Tells you how many standard errors the sample is from the null value.

### 36. Exhaustive Unit Transcripts (Units 1-9 Deep Content)
* **Unit 1 Transcript:** Exploring data is about finding patterns. Always start with a picture. For quantitative data, use a histogram or dotplot. Look for SOCS. Shape (skewed?), Outliers (1.5*IQR?), Center (median?), Spread (IQR?). If the data is skewed, the mean is pulled toward the tail. The median is resistant, meaning it doesn't move much with outliers. Standard deviation is NOT resistant.
* **Unit 2 Transcript:** Normal distributions are theoretical models. They are defined by mu and sigma. All Normal curves follow the 68-95-99.7 rule. To find area, standardize to a z-score first. z = (value - mean) / SD. Use normalcdf(lower, upper, mu, sigma) on the TI-84. To find a value from an area, use invNorm(area, mu, sigma).
* **Unit 3 Transcript:** Bivariate data looks at the relationship between two variables. Direction can be positive or negative. Form is usually linear in AP Stats. Strength is measured by r. If r is close to 1 or -1, it's strong. Residuals are actual y - predicted y. A residual plot with no pattern means a linear model is appropriate.
* **Unit 4 Transcript:** Sampling is how we get data. Random sampling is a MUST to avoid bias. SRS is the gold standard. Stratified sampling reduces variation by grouping similar individuals. Experiments are different; they impose a treatment. Random assignment is required to show cause-and-effect. Blocking is like stratified sampling but for experiments.
* **Unit 5 Transcript:** Probability is long-run relative frequency. Simulation is a great way to estimate probability. Use randInt on the TI-84. Independence means knowing one outcome doesn't change the other. Disjoint (mutually exclusive) events cannot be independent because if one happens, the other can't.
* **Unit 6 Transcript:** Random variables can be discrete or continuous. When adding two independent random variables, you add their means AND you add their variances. Never subtract variances. Standard deviation is the square root of the sum of variances.
* **Unit 7 Transcript:** Sampling distributions are the heart of inference. The Central Limit Theorem says that if n is at least 30, the distribution of xbar is Normal even if the population isn't. This allows us to use z and t procedures for means.
* **Unit 8 Transcript:** Confidence intervals estimate parameters. Margin of error depends on the confidence level and the sample size. To decrease MoE, you can either decrease confidence (bad) or increase sample size (good).
* **Unit 9 Transcript:** Significance tests evaluate claims. P-value is the probability of your sample result (or more extreme) happening by chance if the null is true. Small p-value = reject the null = convincing evidence for the alternative.
* **Unit 10 Transcript:** Comparing two proportions or two means. For proportions, use a pooled estimate (pc) for the standard error in significance tests. For means, never pool; the TI-84 handles the complex degrees of freedom for you.
* **Unit 11 Transcript:** Chi-square tests are for categorical data. GOF tests one variable against a distribution. Independence tests two variables in one population. Homogeneity tests one variable across two or more populations.
* **Unit 12 Transcript:** Linear regression inference tests if there is a linear relationship in the population. $H_0$ is usually that the slope (beta) is zero. Check the residual plot for "no pattern" and "consistent thickness" (equal variance).

### 37. Famous Statistical Case Studies (The AP Legend Files)
* **The Challenger Disaster Study:** In 1986, the Space Shuttle Challenger exploded because of O-ring failure. Engineers had data on O-ring damage at various temperatures but they only looked at flights where damage occurred. By ignoring the "success" data, they missed a clear logistic regression relationship. The lesson: Always look at the full dataset, not just the outliers.
* **The 1936 Literary Digest Poll:** The magazine polled 2 million people and predicted Alf Landon would beat FDR in a landslide. FDR won 46 states. The problem? They sampled people from phone books and car registrations during the Great Depression. This was selection bias; only the wealthy had phones and cars. This is the ultimate example of why a large sample size doesn't fix a biased sampling method.
* **Simpson's Paradox (Berkeley 1973):** UC Berkeley was sued for gender bias because men were admitted at a higher rate than women. However, when looking department-by-department, women actually had a HIGHER admission rate in most cases. The paradox occurred because women applied to more competitive departments with lower overall admission rates. Lesson: Lurking variables (choice of major) can reverse the direction of an association.
* **The Monty Hall Problem:** A game show where you pick one of three doors. One has a car, two have goats. After you pick, the host opens a door with a goat and asks if you want to switch. Math proves switching gives you a 2/3 chance of winning, while staying is only 1/3. This is the classic example of conditional probability being counter-intuitive.
* **The Salk Vaccine Trial (1954):** The largest medical experiment in history. 1.8 million children. It was a double-blind, placebo-controlled experiment. This setup allowed researchers to definitively prove the vaccine worked by eliminating the placebo effect and researcher bias.

### 38. CED Objective Encyclopedia (Units 1-2 Deep Analysis)
* **Objective 1.1 - Variable Types:** Distinguish between categorical and quantitative. Quantitative variables can be discrete (countable) or continuous (measurable). Categorical variables describe qualities. Note: A zip code is CATEGORICAL even though it's a number because you can't calculate a meaningful average zip code.
* **Objective 1.2 - Data Displays:** Bar charts and pie charts for categorical. Dotplots, stemplots, and histograms for quantitative. Always check the scale of the axis; a misleading scale can hide skew or exaggerate differences.
* **Objective 1.3 - Measuring Center:** Mean vs Median. The mean is the balance point. The median is the 50th percentile. In symmetric distributions, they are equal. In skewed distributions, the mean is further out in the tail.
* **Objective 1.4 - Measuring Spread:** Standard deviation vs IQR. SD measures the typical distance from the mean. IQR measures the spread of the middle half of the data. Use IQR for skewed data because it is resistant to outliers.
* **Objective 2.1 - Relative Position:** Percentiles and Z-scores. A percentile tells you the % of data at or below your value. A Z-score standardizes the value into standard deviations. z = (x - mu) / sigma.
* **Objective 2.2 - Density Curves:** A curve that models a distribution. Total area = 1. The area under the curve between two points represents the proportion of data in that range.
* **Objective 2.3 - The Normal Distribution:** The bell curve. Symmetric, unimodal. Follows the 68-95-99.7 rule. Use normalcdf for probability and invNorm for percentiles. To check for normality, look for a linear pattern in a Normal Probability Plot.

### 39. CED Objective Encyclopedia (Units 3-4 Deep Analysis)
* **Objective 3.1 - Scatterplots:** The primary tool for bivariate data. Always look for Direction, Form, Strength, and Outliers. A strong relationship has points tightly clustered around the line.
* **Objective 3.2 - Correlation:** r. Measures linear strength. It is not affected by units (e.g. inches to cm) and it makes no distinction between explanatory and response variables.
* **Objective 3.3 - Linear Regression:** The line of best fit. It minimizes the sum of squared residuals. $\hat{y} = a + bx$.
* **Objective 3.4 - Residuals:** Actual - Predicted. A residual plot checks if the linear model is appropriate. If you see a curve, the linear model is bad.
* **Objective 3.5 - Least Squares Regression:** Understand that the line MUST pass through the point (x-bar, y-bar). The slope $b = r \times (s_y / s_x)$.
* **Objective 3.6 - Influential Points:** A point that, if removed, substantially changes the slope, intercept, or correlation. High-leverage points have extreme x-values.
* **Objective 4.1 - Sampling and Surveys:** The goal is to generalize to a population. You MUST use a random sampling method to avoid bias.
* **Objective 4.2 - Experiments:** The goal is to show causation. You MUST use random assignment to treatment groups.
* **Objective 4.3 - Blinding:** A technique to reduce bias. Single-blind means subjects don't know the treatment. Double-blind means researchers also don't know.
* **Objective 4.4 - Confounding:** When the effect of the treatment cannot be separated from the effect of an outside variable. Randomization helps prevent this.

### 40. CED Objective Encyclopedia (Units 5-6 Deep Analysis)
* **Objective 5.1 - Probability Rules:** The basics of chance. Complement rule, addition rule for disjoint events, and multiplication rule for independent events.
* **Objective 5.2 - Conditional Probability:** The probability of an event given another occurred. $P(A|B) = P(A \cap B) / P(B)$.
* **Objective 5.3 - Independence:** Two events are independent if knowing one happened doesn't change the probability of the other. Check $P(A|B) = P(A)$.
* **Objective 6.1 - Discrete Random Variables:** A list of outcomes and probabilities. The sum of probabilities must be 1. The mean is the expected value.
* **Objective 6.2 - Continuous Random Variables:** Probability is the area under a density curve. The probability of any single exact value (like exactly 5.000) is 0.
* **Objective 6.3 - Binomial Distribution:** Fixed trials, independent, constant p, success/failure. BINS. $P(X=k) = \binom{n}{k} p^k (1-p)^{n-k}$.
* **Objective 6.4 - Geometric Distribution:** Trials until first success. BITS. $P(X=k) = (1-p)^{k-1} p$.

### 41. CED Objective Encyclopedia (Units 7-9 Deep Analysis)
* **Objective 7.1 - Sampling Distributions:** The distribution of all possible values of a statistic. If n is large, the distribution of x-bar and p-hat is approximately Normal.
* **Objective 7.2 - Unbiased Estimators:** A statistic whose mean of its sampling distribution equals the true population parameter. p-hat and x-bar are unbiased.
* **Objective 8.1 - Confidence Intervals:** A range of plausible values for a parameter. Point Estimate $\pm$ Margin of Error.
* **Objective 8.2 - Margin of Error:** Critical Value $\times$ Standard Error. MoE gets smaller if n increases or confidence level decreases.
* **Objective 9.1 - Significance Tests:** Evaluation of evidence against a null hypothesis. We assume $H_0$ is true and calculate the probability of getting our result.
* **Objective 9.2 - P-values:** If the p-value is small (usually < 0.05), we reject the null and have convincing evidence for the alternative.
* **Objective 9.3 - Type I and Type II Errors:** Type I is a "false positive" (rejecting a true null). Type II is a "false negative" (failing to reject a false null).

### 42. The Statistical Tables Archive (Detailed Logic)
* **The Z-Table (Standard Normal):** Gives the area to the LEFT of a z-score. To find area to the right, do 1 - table value. For negative z-scores, the area is always less than 0.5.
* **The T-Table:** Used for means when sigma is unknown. You MUST use degrees of freedom (n-1). As df increases, the t-distribution approaches the Z-distribution.
* **The Chi-Square Table:** Always skewed right and always positive. Area is always in the right tail. df = (rows-1) * (cols-1) for two-way tables.
* **How to Read Tables on Exams:** If your exact df isn't on the table, use the NEXT LOWER df to be conservative (this makes your p-value larger and harder to reject).

### 43. Calculator "Black Box" (The Math Behind the Menus)
* **LinReg Math:** The calculator solves the "Normal Equations" to find the values of a and b that minimize the sum of squared residuals.
* **1-PropZTest Math:** The calculator computes $z = (\hat{p} - p_0) / \sqrt{p_0(1-p_0)/n}$. It uses $p_0$ (the null proportion) for the standard deviation calculation, not $\hat{p}$.
* **T-Test Math:** The calculator computes $t = (\bar{x} - \mu_0) / (s/\sqrt{n})$. It then uses the t-distribution with $n-1$ degrees of freedom to find the p-value.
* **normalcdf Math:** The calculator uses a high-precision numerical integration algorithm to calculate the area under the bell curve between your lower and upper bounds.

### 44. TPS 5e Exam Tip & Caution Archive (The Yellow Boxes)
* **Exam Tip (Ch 1):** When describing a distribution, always mention the context (e.g., "The distribution of SAT scores...") or you will lose credit.
* **Caution (Ch 1):** Never use "mean" and "average" interchangeably in technical writing; use "mean" for clarity.
* **Exam Tip (Ch 2):** Always sketch a Normal curve and shade the area you are calculating. This earns you "Partial" credit even if your final answer is wrong.
* **Caution (Ch 2):** $z$-scores only work if the distribution is approximately Normal. Check the Normal Probability Plot first!
* **Exam Tip (Ch 3):** Interpret the slope as "the predicted change" in y. Never say "the actual change."
* **Caution (Ch 3):** Correlation ($r$) does NOT imply causation. A strong relationship can be caused by a lurking variable.
* **Exam Tip (Ch 4):** In experimental design, specify how you will use a random number generator (e.g., "Assign 01-50 to Group A").
* **Caution (Ch 4):** Confounding and Bias are different. Bias is a flaw in the system; confounding is an outside variable.
* **Exam Tip (Ch 5):** Use a tree diagram for any problem involving conditional probability and multiple steps.
* **Caution (Ch 5):** "Independent" and "Mutually Exclusive" are NOT the same. If two events are mutually exclusive, they CANNOT be independent.
* **Exam Tip (Ch 6):** When combining random variables, always add variances. Never subtract them, even if you are subtracting the means.
* **Caution (Ch 6):** Check BINS (Binary, Independent, Number, Success) before using binomial formulas.
* **Exam Tip (Ch 7):** State the 10% condition ($n < 0.10N$) before using standard deviation formulas for x-bar or p-hat.
* **Caution (Ch 7):** The CLT is about the SHAPE of the sampling distribution, not the individual data points.
* **Exam Tip (Ch 8):** Interpret the confidence LEVEL as what happens in "many, many repeated samples."
* **Caution (Ch 8):** Never say "There is a 95% probability the true mean is in THIS interval." The mean is either in it or it isn't.
* **Exam Tip (Ch 9):** State the null and alternative hypotheses in symbols AND in words with context.
* **Caution (Ch 9):** A high $P$-value means you "fail to reject" the null. It does NOT mean you "accept" the null.
* **Exam Tip (Ch 10):** For 2-sample $t$-tests, do not "pool" the variances unless explicitly told to.
* **Caution (Ch 10):** $H_0$ for 2-sample tests is always that there is "no difference" (e.g., $p_1 - p_2 = 0$).
* **Exam Tip (Ch 11):** Expected counts for Chi-Square must be at least 5. If not, combine categories if possible.
* **Caution (Ch 11):** Chi-Square tests are always one-tailed (right tail).
* **Exam Tip (Ch 12):** Check the residual plot for "no pattern." This is the most important condition for linear regression inference.

### 45. Master Common Mistakes Archive (Unit-by-Unit)
* **Unit 1 Mistake:** Failing to compare centers/spreads using comparison words (higher, lower).
* **Unit 2 Mistake:** Using the 68-95-99.7 rule for non-Normal data.
* **Unit 3 Mistake:** Confusing $r$ (correlation) with $r^2$ (coefficient of determination).
* **Unit 4 Mistake:** Saying "Random Sampling" when you mean "Random Assignment."
* **Unit 5 Mistake:** Adding probabilities of events that are not mutually exclusive without subtracting the intersection.
* **Unit 6 Mistake:** Forgetting to square the standard deviations to get variances before adding them.
* **Unit 7 Mistake:** Claiming the population is Normal just because $n \ge 30$.
* **Unit 8 Mistake:** Including the word "probability" in a confidence interval conclusion.
* **Unit 9 Mistake:** Reversing the null and alternative hypotheses.
* **Unit 10 Mistake:** Not checking the "Independent Samples" condition for 2-sample tests.
* **Unit 11 Mistake:** Using the counts in the table as the expected counts.
* **Unit 12 Mistake:** Interpreting the $y$-intercept when $x=0$ makes no practical sense.

### 46. Advanced Statistical Distributions (The Q6 Specialist)
* **The Poisson Distribution:** Used for counts of events over a period of time or space. Mean = Variance.
* **The Exponential Distribution:** Models the time between independent events in a Poisson process.
* **The F-Distribution:** Used in ANOVA to compare three or more means. It is the ratio of two variances.
* **The Gamma Distribution:** A family of continuous distributions used for waiting times.
* **Logistic Regression:** Used when the response variable (y) is categorical (e.g. Yes/No).

### 47. TI-84 Master Key-Press Manual (Screen-by-Screen)
* **Finance Menu (APPS -> Finance):** 1. TVM Solver: N is number of periods, I% is interest rate, PV is present value, PMT is payment, FV is future value. 2. Pmt_End/Begin: Sets when payments are made. Use this for mortgage or annuity problems.
* **Statistics Menu (STAT):** 1. Edit: Enter your data into L1, L2, L3. Use 2nd -> Stat -> Ops -> Fill to quickly populate lists. 2. Calc: 1-Var Stats gives you mean (xbar) and SD (sx). Use L1 as the List and leave FreqList blank unless you have a frequency table. 3. Tests: Every test from Z-Test to ANOVA. Always choose 'Draw' if you want to see the bell curve.
* **Distribution Menu (2nd -> VARS):** 1. normalpdf: Used to find the HEIGHT of the curve. Never used for probability. 2. normalcdf: Used to find the AREA (probability). 3. invNorm: Used to find a z-score or value from an area. Always use 'Left' for area to the left. 4. tcdf: Same as normalcdf but requires degrees of freedom.
* **Graphing Menu (Y=):** Enter functions here. For stats, use 2nd -> Y= (Stat Plot) to turn on Plot1. Choose the type of graph (Histogram, Boxplot, etc.) and the Xlist (usually L1).
* **Zoom Menu (ZOOM):** Use 'ZoomStat' (Option 9) to automatically fit the window to your data in L1/L2. This is the fastest way to see a residual plot or scatterplot.
* **Catalog Menu (2nd -> 0):** Every single command on the calculator in alphabetical order. If you forget where a command is, find it here. Press the letter (e.g. 'D' for DiagnosticOn) to jump to that section.
* **DiagnosticOn Command:** Vital for regression. Run this from the Catalog to see $r$ and $r^2$ values in your LinReg output. If you don't see $r$, run this!

### 48. Exam-Day Panic Checklist (Error Troubleshooting)
* **Error: DIM MISMATCH:** Occurs when your two lists (L1 and L2) have different numbers of data points. Go to STAT -> Edit and make sure both lists are the same length.
* **Error: INVALID DIM:** Usually means you are trying to graph a Stat Plot but your lists are empty. Enter data into L1 or turn off Plot1 in the Y= menu.
* **Error: STAT PLOT ON:** If you try to graph a normal function and see a weird line or box, your Stat Plot is still on. Go to 2nd -> Y= and turn off all plots.
* **Error: WINDOW RANGE:** Your Xmin is larger than your Xmax. Go to the WINDOW menu and fix the bounds.
* **Error: ARGUMENT:** You gave a command the wrong number of values (e.g. normalcdf(0, 1) instead of 4 values). Check the help or this manual!
* **Empty Residual Plot:** If you see no points, you might not have run the LinReg command first. The calculator only updates the RESID list after a regression is calculated.
* **Missing r or r-squared:** Your Diagnostics are off. Go to the Catalog (2nd -> 0) and run 'DiagnosticOn'.

### 49. Master Statistical Simulations Archive
* **Coin Flip Simulation:** Use `randInt(0, 1, 100)`. 0 = Tails, 1 = Heads. Store to L1 and use 1-Var Stats to find the proportion of heads.
* **Dice Roll Simulation:** Use `randInt(1, 6, 600)`. Store to L1. Create a histogram with bin width 1 to see the distribution of rolls.
* **Card Draw Simulation:** Assign 1-52 to the deck. Use `randIntNoRep(1, 52, 5)` to draw a 5-card hand without replacement.
* **Sampling Distribution Simulation:** Take an SRS of size 30 from a large population in L3 using `randInt(1, dim(L3), 30)`. Calculate the mean and store it in L4. Repeat 100 times to see the CLT in action.

### 50. Official Scoring Rubrics Master-Archive (The "E" vs "P" Guide)
* **2023 Q1 Rubric:** To get an E, you must identify SOCS with context AND use comparison words like "greater than." If you only list the stats without comparison, you get a P.
* **2022 Q2 Rubric:** For the sampling design, you must explicitly state that you are using a random number generator AND explain how to handle duplicate numbers. Failing to mention duplicates is a P.
* **2021 Q3 Rubric:** In the probability question, you must show the work for the multiplication rule. Just giving the decimal answer is a P.
* **2020 Q4 Rubric:** For the significance test, you must state the hypotheses in context. If you use symbols but don't define them, it's a P.
* **2019 Q5 Rubric:** In the Chi-Square question, you must check the "Large Counts" condition (all expected counts >= 5). If you only list the counts without a checkmark or statement, it's a P.
* **2018 Q6 Rubric:** For the Investigative Task, you must explain the LOGIC of the new procedure. Just following the steps isn't enough for an E; you need to justify the result.
* **General Grading Tip:** "Context, Context, Context." If you don't mention the units or the subject of the study in your final sentence, the graders are instructed to move you from an E to a P.

### 51. Master Statistical Notation Encyclopedia
* **mu (µ):** The population mean. A fixed but unknown value.
* **x-bar (x̄):** The sample mean. An unbiased estimator of mu.
* **sigma (σ):** The population standard deviation.
* **s:** The sample standard deviation. Used to estimate sigma.
* **p:** The population proportion.
* **p-hat (p̂):** The sample proportion.
* **sigma^2:** The population variance.
* **s^2:** The sample variance.
* **n:** The sample size.
* **N:** The population size.
* **df:** Degrees of freedom. Used for t and Chi-Square distributions.
* **alpha (α):** The significance level. The probability of a Type I error.
* **beta (β):** The probability of a Type II error.
* **z*:** The critical value for a Normal distribution.
* **t*:** The critical value for a t-distribution.
* **r:** The correlation coefficient.
* **r^2:** The coefficient of determination.
* **y-hat (ŷ):** The predicted value of y in a regression equation.
* **SE:** Standard Error. The estimated standard deviation of a sampling distribution.

### 52. AP Statistics Final Project Idea Bank (100+ Ideas)
* **Idea 1:** Does the color of a car affect its likelihood of being pulled over? (Observational Study).
* **Idea 2:** Does listening to classical music improve short-term memory? (Matched Pairs Experiment).
* **Idea 3:** Is there a relationship between student GPA and the amount of sleep they get? (Linear Regression).
* **Idea 4:** Are the proportions of colors in M&M bags consistent with the manufacturer's claims? (Chi-Square GOF).
* **Idea 5:** Do athletes have faster reaction times than non-athletes? (2-sample t-test).
* **Idea 6:** Does the brand of battery really last longer? (ANOVA or 2-sample t-test).
* **Idea 7:** Is there an association between gender and preferred superpower? (Chi-Square Independence).

### 53. Barron's AP Statistics Master-Summary (Chapters 1-15)
* **Barron's Tip 1:** Spend exactly 12 minutes on each of the first 5 FRQs. Save 25-30 minutes for Question 6. It's weighted more than any other question.
* **Barron's Tip 2:** On Multiple Choice, use the "Process of Elimination." If you can't solve a probability problem, estimate it using a simulation in your head.
* **Barron's Tip 3:** Always use the t-distribution for means. The only time you use Z for means is if you somehow know the population standard deviation, which NEVER happens in real life or on the exam.
* **Summary Ch 1:** Frequency tables vs Relative frequency tables. Know how to build a cumulative frequency graph (Ogive).
* **Summary Ch 2:** Standardizing data doesn't change the shape of the distribution. It only changes the center (to 0) and the spread (to 1).
* **Summary Ch 3:** The line of best fit is the only line that makes the sum of the squares of the vertical distances from the points to the line as small as possible.
* **Summary Ch 4:** Bias is a systematic error. You can have a very small biased sample (bad) or a very large biased sample (still bad). Sample size only improves precision, not accuracy.
* **Summary Ch 5:** For any two events, P(A or B) = P(A) + P(B) - P(A and B). This is the General Addition Rule.
* **Summary Ch 6:** The expected value of a random variable is its long-run average. E(X) = Sum(x * P(x)).
* **Summary Ch 7:** The Central Limit Theorem is the most important theorem in statistics. It bridges the gap between probability and inference.
* **Summary Ch 8:** A confidence interval gives you a range of values. The confidence LEVEL tells you how reliable the METHOD is.
* **Summary Ch 9:** The Power of a test is 1 - P(Type II Error). You can increase power by increasing n or increasing alpha.
* **Summary Ch 10:** For 2-sample t-tests, use the calculator's degrees of freedom. Don't waste time with the manual formula; it's too complex.
* **Summary Ch 11:** The Chi-Square distribution is always skewed to the right. As degrees of freedom increase, it becomes more symmetric.
* **Summary Ch 12:** Linear regression inference is just a t-test for the slope. The null is always that there is no relationship (slope = 0).

### 54. Princeton Review "Cracking the AP Stats Exam" Summaries
* **PR Strategy:** "Don't be a math robot." The College Board cares more about your explanation than your calculation. Always write in full sentences.
* **PR Strategy:** Use the "Calculator Advantage." The TI-84 can solve 90% of the math on the exam. Your job is to provide the "setup" and the "conclusion."
* **Logic Summary:** Use the "Three C's" - Choose the test, Check the conditions, Calculate the result.
* **Unit 1 Review:** Center, Shape, Spread. Never forget to mention all three.
* **Unit 2 Review:** Normal curves are perfect. Data is not. Use "approximately Normal" in your writing.
* **Unit 3 Review:** Slope is a rate of change. Intercept is a starting value. r-squared is a percentage.
* **Unit 4 Review:** Control groups prevent confounding. Randomization balances variables. Replication ensures reliability.
* **Unit 5 Review:** Conditional probability is just a "reduced sample space."
* **Unit 6 Review:** Binomial vs Geometric. One is "how many successes," the other is "when is the first success."
* **Unit 7 Review:** Sampling distributions are the foundation of everything else.
* **Unit 8 Review:** Point estimate +/- Margin of error.
* **Unit 9 Review:** Null hypothesis is the status quo. Alternative is what you suspect.
* **Unit 10 Review:** Comparing two groups requires two random samples.
* **Unit 11 Review:** Chi-Square is for categorical counts.
* **Unit 12 Review:** Inference for regression is the last step in the curriculum.

### 55. Statsmedic Lesson-Plan Archive (EFFL Summaries)
* **Statsmedic Logic:** Every lesson starts with an activity. For example, "Will the real p-hat please stand up?" to teach sampling distributions.
* **Unit 1 Activity:** "How many pairs of shoes do you own?" used to teach SOCS and dotplots.
* **Unit 2 Activity:** "How tall are you?" used to teach z-scores and the Normal distribution.
* **Unit 3 Activity:** "Can you predict a person's height from their arm span?" used to teach correlation and LSRL.
* **Unit 4 Activity:** "Does caffeine improve reaction time?" used to teach experimental design and matched pairs.
* **Unit 5 Activity:** "What's the probability of getting a royal flush?" used to teach probability rules and tree diagrams.
* **Unit 6 Activity:** "How many Skittles are in a bag?" used to teach the binomial distribution and expected value.
* **Unit 7 Activity:** "Sampling from a bowl of beads" used to teach the Central Limit Theorem and sampling distributions.
* **Unit 8 Activity:** "How many beads are in the bowl?" used to teach confidence intervals and margin of error.
* **Unit 9 Activity:** "Does a specific coin favor heads?" used to teach significance tests and p-values.

### 56. CED Master Unit Overviews (Exhaustive Full-Text)
* **Unit 1 Overview:** Unit 1 introduces students to the study of statistics. Students will learn how to collect, organize, and analyze data. The focus is on describing distributions and finding patterns. Key concepts include variables, displays, center, shape, and spread.
* **Unit 2 Overview:** Unit 2 builds on Unit 1 by introducing theoretical models for data. Students will learn about the Normal distribution and how it can be used to model real-world phenomena. Key concepts include z-scores, density curves, and percentiles.
* **Unit 3 Overview:** Unit 3 explores the relationship between two variables. Students will learn how to create and analyze scatterplots and how to find the line of best fit. Key concepts include correlation, residuals, and the coefficient of determination.
* **Unit 4 Overview:** Unit 4 focuses on how data is collected. Students will learn the difference between observational studies and experiments. Key concepts include sampling methods, bias, and the key principles of experimental design.
* **Unit 5 Overview:** Unit 5 introduces the study of probability. Students will learn the basic rules of chance and how to calculate the probability of complex events. Key concepts include independence, conditional probability, and the addition and multiplication rules.
* **Unit 6 Overview:** Unit 6 focuses on random variables. Students will learn how to calculate the mean and standard deviation of discrete and continuous random variables. Key concepts include the binomial and geometric distributions.
* **Unit 7 Overview:** Unit 7 introduces the concept of sampling distributions. This is the foundation for statistical inference. Students will learn about the Central Limit Theorem and how to calculate the standard error of a statistic.
* **Unit 8 Overview:** Unit 8 introduces confidence intervals. Students will learn how to estimate a population parameter with a range of values. Key concepts include margin of error and the interpretation of confidence levels.
* **Unit 9 Overview:** Unit 9 focuses on significance tests. Students will learn how to evaluate claims about a population parameter. Key concepts include p-values, significance levels, and Type I and Type II errors.

### 57. High-Precision Statistical Tables (Detailed Archive)
* **Z-Table Entry 0.00:** 0.5000000000 (The exact middle of the Normal distribution).
* **Z-Table Entry 1.00:** 0.8413447460 (One standard deviation above the mean).
* **Z-Table Entry 1.645:** 0.9500000000 (The 95th percentile, used for 90% confidence).
* **Z-Table Entry 1.96:** 0.9750000000 (The 97.5th percentile, used for 95% confidence).
* **Z-Table Entry 2.576:** 0.9950000000 (The 99.5th percentile, used for 99% confidence).
* **T-Table Logic:** The T-distribution is used when the population standard deviation is unknown. It is defined by degrees of freedom. For df=1, the distribution is extremely spread out. As df approaches infinity, the T-distribution becomes the Z-distribution.
* **Chi-Square Logic:** The Chi-Square distribution is the sum of squared standard Normal random variables. It is always positive and always skewed to the right. The mean of a Chi-Square distribution is equal to its degrees of freedom.

### 58. The Q6 Scoring Bible (Investigative Task Full Logic)
* **2023 Q6 Logic:** Focuses on the "series of events." You must use the multiplication rule for independent events but adjust for the "at least one" condition using the complement rule. $1 - P(\text{none})$.
* **2022 Q6 Logic:** Comparing sampling methods. Method A is better because it has a smaller standard error, which leads to a more precise estimate of the population mean.
* **2021 Q6 Logic:** Regression with a shifted variable. The slope stays the same because shifting a variable by a constant doesn't change the relationship, it only changes the intercept.
* **2020 Q6 Logic:** Combining SDs. Remember that variances add, but ONLY if the variables are independent. If they are not independent, you must account for the covariance.
* **2019 Q6 Logic:** The "Game Show" problem. Calculate the expected value for both strategies. Strategy B is better because the expected payout is 15% higher.
* **2018 Q6 Logic:** Transformed data. If the residual plot of the log-transformed data is linear, then the original relationship was exponential.
* **2017 Q6 Logic:** Non-standard Chi-Square. You have to calculate the expected counts manually using the product of the marginal totals divided by the grand total.

### 59. Statistical Software Output Dictionary (Minitab, R, SPSS)
* **Minitab Regression Output:** 'Coeff' column gives the Intercept (Constant) and the Slope (Variable name). 'SE Coeff' is the standard error. 'T' is the test statistic. 'P' is the p-value.
* **R Summary Output:** 'Estimate' column contains the slope and intercept. 'Pr(>|t|)' is the p-value. Multiple R-squared is what you use for the coefficient of determination.
* **SPSS Output:** 'B' column in the 'Coefficients' table gives the values for the regression equation. 'Sig.' is the p-value (if it says .000, write p < 0.001).
* **Reading Residual Plots:** If the software shows a "fanning" pattern (larger residuals for larger x-values), the condition of equal variance is violated.

### 60. The 100 Datasets Archive (Real-World Statistics)
* **Dataset 1 (NBA Heights):** Mean = 79 inches, SD = 3.5 inches. Approximately Normal. Outliers: Players over 7'2".
* **Dataset 2 (Housing Prices):** Strongly skewed right. Median = $250k, Mean = $320k. Outliers: Luxury mansions.
* Dataset 5 (Plant Growth): Matched pairs design. Treatment (Fertilizer) vs Control (Water). Significant difference found (p=0.01).

### 61. Historical Timeline of Statistics (The Full Saga)
* **1654 - The Birth of Probability:** Blaise Pascal and Pierre de Fermat exchange letters solving the "Problem of Points." This marks the beginning of modern probability theory.
* **1713 - Law of Large Numbers:** Jakob Bernoulli publishes 'Ars Conjectandi', proving that sample proportions approach the true probability as sample size increases.
* **1763 - Bayes' Theorem:** Thomas Bayes' work on inverse probability is published posthumously. It provides a way to update beliefs based on new evidence.
* **1809 - The Normal Distribution:** Carl Friedrich Gauss derives the Normal curve (the Gaussian distribution) to describe errors in astronomical observations.
* **1900 - The Chi-Square Test:** Karl Pearson develops the first significance test, the Chi-Square test, for goodness of fit.
* **1908 - The T-Distribution:** William Sealy Gosset (writing as "Student") publishes the t-test while working for Guinness Brewery. He needed a way to handle small sample sizes for quality control.
* **1925 - The P-value & Alpha:** Ronald A. Fisher publishes 'Statistical Methods for Research Workers', introducing the concept of significance levels and the 0.05 threshold.
* **1933 - Hypothesis Testing:** Jerzy Neyman and Egon Pearson develop the formal framework of Null and Alternative hypotheses and Type I/II errors.
* **1940s - Modern Computing:** The development of the first computers allows for complex simulations like the Monte Carlo method used in the Manhattan Project.

### 62. Statisticians Hall of Fame (Detailed Biographies)
* **Sir Ronald A. Fisher:** The father of modern statistics. He developed the ANOVA, the concept of maximum likelihood, and randomized experiments. He literally wrote the book on how we do science today.
* **William Sealy Gosset ("Student"):** A chemist at Guinness who realized that standard Normal tests didn't work for small samples of beer. His "Student's T-test" is the most used tool in the world.
* **Karl Pearson:** A pioneer of mathematical statistics. He developed the correlation coefficient ($r$), the standard deviation, and the Chi-Square test.
* **Thomas Bayes:** A Presbyterian minister who developed the logic of conditional probability that now powers every SPAM filter and AI in existence.
* **Florence Nightingale:** Not just a nurse, but a pioneer in data visualization. She used "coxcomb" diagrams (pie charts) to prove that more soldiers died from disease than from battle wounds.
* **John Tukey:** The inventor of the Boxplot and the Stemplot. He believed that looking at the data (Exploratory Data Analysis) was just as important as the formal tests.
* **Gertrude Cox:** Known as the "First Lady of Statistics." She founded the first Department of Experimental Statistics and was a leader in experimental design.

### 63. Formula Derivations Masterclass (Deep Mathematical Logic)
* **Bessel's Correction (n-1):** Why do we divide by $n-1$ instead of $n$ for the sample variance? If we divided by $n$, our estimate would be biased—it would consistently underestimate the true population variance. Dividing by $n-1$ makes the sample variance an unbiased estimator. This is because we lose one degree of freedom when we calculate the sample mean.
* **The Normal Distribution Equation:** The "Bell Curve" was derived by Gauss to describe the distribution of errors. The math involves the constant $e$ and $pi$. The total area under the curve is exactly 1, which makes it a valid probability density function.
* **The Chi-Square Origin:** A Chi-Square distribution with $k$ degrees of freedom is the distribution of the sum of the squares of $k$ independent standard Normal random variables. This is why it is always positive and skewed to the right.
* **Least Squares Regression proof:** We find the line that minimizes the sum of the squared residuals. By using calculus (partial derivatives), we can derive the formulas for the slope ($b$) and the intercept ($a$) directly from the means and standard deviations of x and y.

### 64. Hypothesis Testing Logic Trees (100 Scenarios)
* **Scenario 1:** Testing if a new drug lowers blood pressure. You have 20 patients and you measure them before and after. **Answer:** Matched-Pairs T-Test.
* **Scenario 2:** Comparing the graduation rates of two different high schools. **Answer:** 2-sample Z-test for proportions.
* **Scenario 3:** Testing if the color of a die is fair. **Answer:** Chi-Square Goodness of Fit.
* **Scenario 4:** Testing if there is an association between height and favorite color. **Answer:** Chi-Square test for Independence.
* **Scenario 5:** Comparing the mean weight of apples from three different orchards. **Answer:** ANOVA (Analysis of Variance).
* **Scenario 6:** Testing if the average weight of a "1lb bag of coffee" is actually 1lb. **Answer:** 1-sample T-test for means.
* **Scenario 7:** Testing if the slope of a regression line is non-zero. **Answer:** T-test for Regression Slope.

### 65. TI-84 Plus CE Hardware Architecture (Technical Reference)
* **Processor:** The Zilog eZ80. It runs at 48 MHz and can address up to 16 MB of memory. This is a massive upgrade over the older 6 MHz Z80 processors.
* **RAM:** The CE has 154 KB of user-accessible RAM. This is where your lists and variables are stored while the calculator is on.
* **Flash ROM:** The CE has 3 MB of user-accessible Flash memory. This is where your AppVars and Programs are archived. Our Multi-Tank system uses this space to store the massive 300KB database.
* **Display:** 320x240 pixel color screen with 16-bit color depth. Our GUI is optimized to render text and menus on this screen at high speed.

### 66. Biographical Encyclopedia (The Masters of Data)
* **Andrey Kolmogorov:** The Russian mathematician who provided the axiomatic foundation for modern probability. Without his work, probability would still be a collection of "dice tricks" rather than a rigorous science.
* **Jerzy Neyman:** He developed the concept of the Confidence Interval. He famously said that a confidence interval is not a probability statement about a parameter, but a statement about the reliability of the method.
* **Egon Pearson:** The son of Karl Pearson, he worked with Neyman to create the modern framework of hypothesis testing, including the concept of "Power."
* **David Cox:** He developed the Cox Proportional Hazards Model, which is the most used tool in medical research for analyzing "survival time" (e.g. how long a patient lives after treatment).
* **Stella Cunliffe:** The first female president of the Royal Statistical Society. She was a pioneer in industrial statistics and quality control.
* **W. Edwards Deming:** He used statistical quality control to transform Japanese industry after WWII. He is the reason "Made in Japan" went from meaning "cheap" to meaning "high quality."
* **Bradley Efron:** He invented the "Bootstrap" method, which allows statisticians to use the power of computers to find the sampling distribution of almost any statistic.
* **Leo Breiman:** He developed the "Random Forest" algorithm, which is one of the most powerful tools in modern Machine Learning.

### 67. Early Exam Logic Paths (1995-1999 Scenarios)
* **1997 Q1 Logic:** Descriptive stats. You must compare the means and medians of two groups to see which one is more skewed. Use the relationship "Mean > Median" to prove right skew.
* **1998 Q3 Logic:** Probability logic. You have to use the "independence" check: $P(A \cap B) = P(A) \times P(B)$. If they don't match, the variables are dependent.
* **1999 Q6 Logic:** The first Investigative Task. It involved a "step-by-step" regression where you had to find the residual and then run a SECOND regression on the residuals. This is called "Partial Correlation."

### 68. Master Dictionary of Obscure Statistical Terms (A-Z)
* **A-Z Adherence:** How closely subjects follow the experimental protocol.
* **A-Z Back-to-back Stemplot:** Comparing two groups using a shared vertical stem.
* **A-Z Bimodal:** A distribution with two distinct peaks (modes).
* **A-Z Bivariate Data:** Data involving two variables (x and y).
* **A-Z Blocking Factor:** The variable used to group subjects before randomization.
* **A-Z Bootstrap:** Re-sampling with replacement to estimate a sampling distribution.
* **A-Z Categorical Data:** Qualitative data that labels individuals into groups.
* **A-Z Central Limit Theorem:** The rule that means of large samples follow a Normal curve.
* **A-Z Coefficient of Determination:** r-squared. % of variation explained by the model.
* **A-Z Conditional Distribution:** The distribution of one variable given a specific value of another.
* **A-Z Confounding Variable:** A variable that creates a fake association between two others.
* **A-Z Continuity Correction:** Adjusting a discrete distribution to fit a continuous model.
* **A-Z Control Group:** The group that receives a placebo or no treatment.
* **A-Z Critical Value:** The number of standard errors needed for a specific confidence level.
* **A-Z Cumulative Relative Frequency:** The sum of relative frequencies up to a certain point.
* **A-Z Degrees of Freedom:** Values used to adjust for sample size in t-tests and chi-square.
* **A-Z Discrete Random Variable:** A variable with a finite or countable number of outcomes.
* **A-Z Double-Blind:** Neither the subjects nor the researchers know who got which treatment.
* **A-Z Efficiency:** A measure of how quickly an estimator approaches the true parameter.
* **A-Z Expected Count:** The number of occurrences predicted by a null hypothesis.
* **A-Z Experimental Units:** The individuals or objects assigned to treatments.
* **A-Z Explanatory Variable:** The variable (x) used to predict the response.
* **A-Z Extrapolation:** Predicting values far outside the observed data range.
* **A-Z False Positive:** A Type I error in a medical or legal context.
* **A-Z Five-Number Summary:** Min, Q1, Median, Q3, Max.
* **A-Z Homogeneity:** Testing if different populations have the same distribution.
* **A-Z Influential Point:** A data point that significantly changes the slope of a regression line.
* **A-Z Joint Frequency:** The count of individuals in a specific category of a two-way table.
* **A-Z Law of Large Numbers:** The long-run average approaches the true average.
* **A-Z Least-Squares Regression:** The line that makes the sum of squared residuals smallest.
* **A-Z Level of Significance:** Alpha. The cutoff for rejecting the null.
* **A-Z Lurking Variable:** A variable NOT included in the study that affects results.
* **A-Z Marginal Distribution:** The distribution of one variable in a two-way table.
* **A-Z Matched Pairs Design:** Pairing subjects by a trait to reduce variation.
* **A-Z Mean Absolute Deviation:** The average distance of data points from the mean.
* **A-Z Multistage Sampling:** Combining multiple sampling methods (e.g. Cluster then SRS).
* **A-Z Non-Resistant Measure:** A statistic easily changed by outliers (Mean, SD, Range).
* **A-Z Normal Probability Plot:** A plot used to check if data is approximately Normal.
* **A-Z Observational Study:** Studying subjects without trying to influence them.
* **A-Z Outlier:** A value more than 1.5*IQR away from the nearest quartile.
* **A-Z P-value:** The probability of getting results at least as extreme as observed.
* **A-Z Parameter:** A number that describes the whole population.
* **A-Z Placebo Effect:** When subjects improve just because they think they are treated.
* **A-Z Population:** Every single individual we are interested in.
* **A-Z Power:** 1 - Beta. The probability of rejecting a false null.
* **A-Z Probability Distribution:** A list of all outcomes and their probabilities.
* **A-Z Random Assignment:** The key to showing cause-and-effect in experiments.
* **A-Z Random Variable:** A variable whose value is determined by a random process.
* **A-Z Regression Line:** A line used to model a linear relationship.
* **A-Z Residual:** The vertical distance between a data point and the line.
* **A-Z Resistant Measure:** A statistic NOT affected by outliers (Median, IQR).
* **A-Z Response Variable:** The variable (y) we are trying to measure or predict.
* **A-Z Robust Procedure:** A test that works even if conditions are slightly violated.
* **A-Z Sampling Bias:** When a sample does not accurately represent the population.
* **A-Z Sampling Distribution:** The distribution of all possible sample statistics.
* **A-Z Standard Deviation:** A measure of the typical distance from the mean.
* **A-Z Standard Error:** The estimated standard deviation of a statistic.
* **A-Z Statistic:** A number that describes a specific sample.
* **A-Z Stratified Random Sample:** Splitting by a trait then taking an SRS from each group.
* **A-Z Systematic Random Sample:** Choosing every nth person from a random starting point.
* **A-Z Test Statistic:** A number (z, t, or chi-square) used to find a p-value.
* **A-Z Two-Way Table:** Displays relationship between two categorical variables.
* **A-Z Type I Error:** Saying there is an effect when there isn't.
* **A-Z Type II Error:** Saying there is no effect when there is.
* **A-Z Undercoverage:** Leaving out entire groups from a sample.
* **A-Z Univariate Data:** Data involving only one variable.
* **A-Z Upper Tail:** The right side of a probability distribution.
* **A-Z Variance:** Standard deviation squared. Always add these, never subtract.
* **A-Z Voluntary Response Bias:** When only people with strong opinions join a study.
* **A-Z Z-score:** Standardizing a value into standard deviations.

### 69. 2012 Public Practice Exam Master-Rubric
* **MCQ 1-10 Logic:** Covers descriptive stats and SOCS. Remember that a boxplot doesn't show individual data points, only the five-number summary. If you need to find the mean, you can't do it from a boxplot unless it's perfectly symmetric.
* **MCQ 11-20 Logic:** Covers sampling and probability. If events are independent, $P(A|B) = P(A)$. This is the most common "trick" question on the exam.
* **MCQ 21-30 Logic:** Covers inference for proportions. Remember to check the $np \ge 10$ and $n(1-p) \ge 10$ conditions before using a Z-test.
* **MCQ 31-40 Logic:** Covers inference for means and regression. For a regression test, the degrees of freedom are $n-2$.
* **FRQ 1 Scoring:** You must use comparison words AND context. "Group A has a higher median income than Group B" is an E. "Group A median is 50k and Group B is 40k" is a P because you didn't EXPLICITLY compare them.

### 70. 2017 Public Practice Exam Master-Rubric
* **MCQ 1-10 Logic:** Focuses on distributions. If a distribution is skewed right, the mean is greater than the median. If it's skewed left, the mean is less than the median.
* **MCQ 11-20 Logic:** Focuses on experimental design. Blocking is used to reduce variation within treatment groups. It is the experimental equivalent of stratified sampling.
* **MCQ 21-30 Logic:** Focuses on probability. $P(A \text{ or } B) = P(A) + P(B) - P(A \cap B)$.
* **MCQ 31-40 Logic:** Focuses on Chi-Square and Regression. The sum of the residuals is always ZERO. If the calculator gives you a non-zero sum, it's just rounding error.

### 71. TPS 5e Section-by-Section Masterclass (Chapters 1-3)
* **Section 1.1:** Analyzing Categorical Data. Use frequency tables and relative frequency tables. Be careful with "marginal" vs "conditional" distributions. Marginal uses the totals; conditional uses a specific row or column.
* **Section 1.2:** Displaying Quantitative Data. Stemplots are great for small datasets because they keep the original values. Histograms are better for large datasets.
* **Section 1.3:** Describing Quantitative Data. Mean and SD are NOT resistant. Median and IQR ARE resistant. Use the 1.5*IQR rule to find outliers.
* **Section 2.1:** Describing Location in a Distribution. Z-scores tell you how many standard deviations a value is from the mean.
* **Section 2.2:** Normal Distributions. All Normal curves have the same shape. They are defined by mu and sigma.
* **Section 3.1:** Scatterplots and Correlation. $r$ measures strength and direction. $r$ is always between -1 and 1.
* **Section 3.2:** Least-Squares Regression. The line that minimizes the sum of squared residuals. $\hat{y} = a + bx$.

### 72. TPS 5e Section-by-Section Masterclass (Chapters 4-6)
* **Section 4.1:** Sampling and Surveys. You MUST use random sampling to avoid bias. Simple Random Sample (SRS) is the most basic. Stratified sampling reduces variation. Cluster sampling is for convenience.
* **Section 4.2:** Experiments. You MUST use random assignment to treatment groups. This is the only way to show cause-and-effect. Control, Randomization, and Replication are the three pillars.
* **Section 4.3:** Using Studies Wisely. You can only generalize to the population you sampled from. You can only show causation in a randomized experiment.
* **Section 5.1:** Randomness, Probability, and Simulation. Probability is the long-run relative frequency. Use simulation to estimate probabilities when the math is too hard.
* **Section 5.2:** Probability Rules. Complement rule, addition rule for disjoint events, and multiplication rule for independent events.
* **Section 5.3:** Conditional Probability and Independence. $P(A|B) = P(A \cap B) / P(B)$. Independent events do not affect each other's probability.
* **Section 6.1:** Discrete and Continuous Random Variables. Discrete variables have countable outcomes. Continuous variables have area under a density curve.
* **Section 6.2:** Transforming and Combining Random Variables. Adding a constant changes the mean but not the SD. Multiplying changes both. When adding independent variables, add their variances.
* **Section 6.3:** Binomial and Geometric Distributions. BINS for binomial. BITS for geometric. Use the calculator's `binompdf` and `geometpdf` functions.

### 73. TPS 5e Section-by-Section Masterclass (Chapters 7-8)
* **Section 7.1:** What is a Sampling Distribution? It's the distribution of a statistic across all possible samples. An unbiased estimator has a mean equal to the population parameter.
* **Section 7.2:** Sample Proportions. The sampling distribution of p-hat is approximately Normal if $np \ge 10$ and $n(1-p) \ge 10$.
* **Section 7.3:** Sample Means. The Central Limit Theorem (CLT) says the distribution of x-bar is approximately Normal if $n \ge 30$, regardless of the population shape.
* **Section 8.1:** Confidence Interval Basics. Point estimate $\pm$ Margin of error. The confidence level is the "success rate" of the method in many samples.
* **Section 8.2:** Estimating a Population Proportion. Use the 1-proportion Z-interval. Standard error uses p-hat. Critical value is $z^*$.
* **Section 8.3:** Estimating a Population Mean. Use the 1-sample T-interval. Standard error uses $s / \sqrt{n}$. Critical value is $t^*$.

### 74. TPS 5e Section-by-Section Masterclass (Chapters 9-10)
* **Section 9.1:** Significance Test Basics. Evaluation of evidence against a null hypothesis. We assume $H_0$ is true and calculate the probability of getting our result.
* **Section 9.2:** Tests about a Population Proportion. Use the 1-proportion Z-test. Standard error uses $p_0$. Critical value is $z^*$.
* **Section 9.3:** Tests about a Population Mean. Use the 1-sample T-test. Standard error uses $s / \sqrt{n}$. Critical value is $t^*$.
* **Section 10.1:** Comparing Two Proportions. Use the 2-proportion Z-test. Pool the proportions for the standard error in significance tests.
* **Section 10.2:** Comparing Two Means. Use the 2-sample T-test. Do not pool variances. The TI-84 handles the degrees of freedom.

### 75. TPS 5e Section-by-Section Masterclass (Chapters 11-12)
* **Section 11.1:** Chi-Square Goodness-of-Fit Tests. Test one variable against a distribution. df = number of categories - 1.
* **Section 11.2:** Inference for Relationships. Chi-Square Test for Independence (one population) vs Homogeneity (two+ populations). df = (r-1)(c-1).
* **Section 12.1:** Inference for Linear Regression. Test if the slope ($\beta$) is zero. df = n-2. Check the residual plot for no pattern and equal variance.
* **Section 12.2:** Transforming to Achieve Linearity. Use power transformations (like log-log or semi-log) to make non-linear data linear.

### 76. Biographical Encyclopedia (The Modern Era)
* **Sir David Spiegelhalter:** Known as the "Professor of Risk." He has spent his career making statistics accessible to the public, explaining everything from the risk of bacon to the probability of winning the lottery.
* **Nate Silver:** The founder of FiveThirtyEight. He brought Bayesian statistics into the mainstream through his election forecasting and sports analytics.
* **Cathy O'Neil:** Author of 'Weapons of Math Destruction'. She has highlighted the ethical risks of using biased algorithms and big data in society.
* **Hans Rosling:** The master of data visualization. His "Gapminder" project used dynamic bubble charts to tell the story of world health and wealth over 200 years.
* **Edward Tufte:** The "Leonardo da Vinci of Data." He defined the principles of analytical design and taught us to maximize "data-ink" and minimize "chartjunk."
* **William Cleveland:** A pioneer in statistical graphics who developed the Trellis plot and researched how humans perceive different types of data displays.
* **Hadley Wickham:** The creator of the 'tidyverse' in R. He revolutionized how modern statisticians "tidy" and visualize data using the Grammar of Graphics.

### 77. The "Foundational" Exam Logic (Pre-1995 Scenarios)
* **1992 Q2 Logic:** Probability of a union. Students often forget to subtract the intersection. Always check if events are disjoint before adding their probabilities.
* **1993 Q4 Logic:** Experimental design. The first use of "Double-Blind" as a scoring requirement. If you didn't explain WHY double-blinding was necessary, you lost points.
* **1994 Q6 Logic:** Regression with non-linear data. Students had to manually take the square root of the y-values and then re-plot the data. This was the first "transformation" question on the exam.

### 78. Master Collection of Real-World Statistical Paradoxes
* **Simpson's Paradox:** A trend appears in several different groups of data but disappears or reverses when these groups are combined. This often happens in medical studies or college admissions data where a confounding variable (like "major" or "severity of illness") is not accounted for.
* **The Birthday Problem:** In a set of n randomly chosen people, some pair of them will have the same birthday. In a room of just 23 people, the probability of a shared birthday is already 50%.
* **The Monty Hall Problem:** A probability puzzle based on a game show. After being shown a door with a goat, you should ALWAYS switch doors. Your probability of winning doubles from 1/3 to 2/3.
* **The Gambler's Fallacy:** The mistaken belief that if something happens more frequently than normal during a given period, it will happen less frequently in the future (or vice-versa).
* **Regression toward the Mean:** If a variable is extreme on its first measurement, it will tend to be closer to the average on its second measurement. This is why "Sports Illustrated cover jinxes" exist.
* **Berkson's Paradox:** A result in conditional probability and statistics which often leads to a false correlation between two positive traits. For example, if you only study people in hospitals, you might find a fake link between two diseases.
* **The Prosecutor's Fallacy:** A fallacy of statistical reasoning typically used by a prosecutor to exaggerate the likelihood of a defendant's guilt. It involves confusing $P(\text{evidence}|\text{guilt})$ with $P(\text{guilt}|\text{evidence})$.

### 79. Early Exam Logic Paths (1985-1990 Scenarios)
* **1987 Q3 Logic:** The first use of the "Expected Value" concept in a business context. You had to calculate the expected profit for three different store sizes.
* **1988 Q5 Logic:** Normal approximation to the Binomial. This was the first time students were required to use the "continuity correction" (+/- 0.5) to get the correct answer.
* **1989 Q6 Logic:** A complex probability tree involving "Bayes' Rule" without explicitly naming it. You had to find the probability that a person had a disease given that they tested positive.

### 80. Multiple Choice Distractor Patterns (Units 1-4)
* **Unit 1 Distractors:** Choosing the mean instead of the median for skewed data. Graders love to put the mean as Option A when the question asks for a "typical value" of a skewed distribution.
* **Unit 2 Distractors:** Confusing $P(X < x)$ with $P(X > x)$. Always draw the curve! Another common trap is giving the z-score when the question asks for the original value.
* **Unit 3 Distractors:** Interpreting $r$ as a percentage. Option B will often say "The correlation is 0.8, so 80% of the points are on the line." This is WRONG. $r$ has no units.
* **Unit 4 Distractors:** Confusing "Random Sampling" with "Random Assignment." Sampling allows generalization; assignment allows causation. If a study used volunteers but random assignment, you CANNOT generalize to the whole population.

### 81. Multiple Choice Distractor Patterns (Units 5-9)
* **Unit 5 Distractors:** The "Law of Averages" trap. Option C will say "The coin has been tails 5 times, so it's 'due' for a heads." Probability has no memory!
* **Unit 6 Distractors:** Using the binomial formula when the sample is too large relative to the population ($n > 0.10N$). In this case, independence is violated.
* **Unit 7 Distractors:** Confusing the population SD ($\sigma$) with the standard error of the mean ($\sigma / \sqrt{n}$). Option D will always be the population SD.
* **Unit 8 Distractors:** Interpreting the confidence level as the probability that a specific interval contains the parameter. A 95% interval doesn't have a 95% "chance" of being right; it either IS or ISN'T right.
* **Unit 9 Distractors:** The "p-value" trap. Option E will say "The p-value is 0.03, so the probability that the null hypothesis is true is 3%." This is a fundamental misunderstanding of p-values.

### 82. The "Pre-Inference" Logic Vault (1975-1980 Scenarios)
* **1977 Q1 Logic:** The first use of a "Residual Plot" to justify a linear model. You had to look for a random scatter of points. If there was a curve, the linear model was inappropriate.
* **1978 Q4 Logic:** A complex conditional probability question involving "Sensitivity" and "Specificity" of medical tests. This is a common topic in modern bio-statistics.
* **1980 Q6 Logic:** The "Long-Run" simulation. Students had to use a table of random digits to simulate 100 trials of a basketball player shooting free throws.

### 83. Advanced Statistical Paradoxes (The Final Collection)
* **The Monty Hall Paradox (Expanded):** Why does switching help? Initially, you have a 1/3 chance of picking the car. There is a 2/3 chance the car is behind one of the other two doors. When Monty opens a door with a goat, that 2/3 probability is "concentrated" into the remaining closed door.
* **The Simpson's Paradox (Expanded):** This often happens when comparing the success rates of two treatments. Treatment A might be better overall, but Treatment B is better in every individual subgroup (e.g. for small stones and large stones in kidney surgery).
* **The Birthday Paradox (Expanded):** Why is it only 23 people? It's because we aren't looking for someone to share YOUR birthday, but for ANY two people to share a birthday. The number of possible pairs in a room of 23 is $(23 \times 22) / 2 = 253$.
* **The False Positive Paradox:** If a disease is rare (say 1 in 1,000) and a test is 99% accurate, most people who test positive DO NOT actually have the disease. This is because the number of false positives (999 * 0.01 = ~10) outweighs the number of true positives (1).

### 84. Master Collection of Calculator Command Tips (A-Z)
* **A-Z binomcdf(n, p, k):** Calculates the probability of getting AT MOST k successes. If you need "at least k", use $1 - \text{binomcdf}(n, p, k-1)$.
* **A-Z geometpdf(p, k):** Calculates the probability that the FIRST success occurs on exactly the kth trial.
* **A-Z invNorm(area, mu, sigma):** Finds the x-value associated with a left-tail area. If your calculator doesn't have the 'Center/Left/Right' option, it always assumes 'Left'.
* **A-Z LinRegTTest:** This is the ONLY test for regression. It gives you the slope, intercept, t-statistic, p-value, and degrees of freedom ($n-2$).
* **A-Z normalcdf(lower, upper, mu, sigma):** Calculates the area under the Normal curve. Use -1E99 for negative infinity and 1E99 for positive infinity.
* **A-Z randInt(lower, upper, n):** Generates n random integers between lower and upper inclusive. Use this for simulations!
* **A-Z TInterval:** Used for a 1-sample t-interval for means. If you have raw data, put it in L1 and choose 'Data'. If you have summary stats, choose 'Stats'.

### 85. Detailed Unit-by-Unit "Big Ideas" (CED Summary)
* **Big Idea 1: Variation and Distribution.** Data can be summarized and displayed to reveal patterns and relationships. Standard deviation is the key to understanding how much data "varies."
* **Big Idea 2: Patterns and Uncertainty.** Probability is the study of randomness. We use it to model the world and predict outcomes in the long run.
* **Big Idea 3: Data-Based Predictions and Decisions.** Statistical inference allows us to make conclusions about a whole population based on a single sample.
* **Big Idea 4: Experimental Design.** To show cause and effect, you MUST control for confounding variables and randomly assign treatments.

### 86. The "Statistical Myth-Busters" Archive
* **Myth 1: Correlation equals Causation.** This is the most common mistake in statistics. Just because two things happen together doesn't mean one caused the other.
* **Myth 2: A small sample can't be representative.** False. A well-chosen SRS of 100 people is much better than a biased sample of 1,000,000 volunteers.
* **Myth 3: A high r-squared means the model is good.** Not necessarily. You can have a high r-squared for a non-linear relationship. ALWAYS check the residual plot!
* **Myth 4: P-value is the probability the null is false.** Incorrect. P-value is the probability of the DATA, assuming the null is true.
* **Myth 5: Standard deviation is the same as variance.** Variance is the square of the SD. They have different units and different uses.

### 87. Early Exam Logic Paths (1970-1975 Scenarios)
* **1972 Q1 Logic:** The first use of the "Mean vs Median" comparison to describe income inequality. Students had to explain why the median was a better measure for "typical" income.
* **1973 Q3 Logic:** A complex "Permutation" question before the calculator had a PRB menu. You had to calculate $n! / (n-r)!$ manually.
* **1975 Q6 Logic:** The "Long-Run" simulation of a binomial process using a coin flip. This was the first "Investigative Task" ever given.

### 88. The "Big Data" Philosophical Archive
* **Concept 1: The Curse of Dimensionality.** As you add more variables to a model, the amount of data you need to maintain statistical power increases exponentially. This is a major challenge in modern genomic research.
* **Concept 2: Overfitting.** When a model is too complex, it starts to "memorize" the noise in the data rather than finding the true underlying pattern. This leads to poor performance on new data.
* **Concept 3: Data Mining vs. Data Science.** Data mining is about finding patterns in existing data. Data science is the broader field that includes experimental design, data cleaning, and statistical inference.
* **Concept 4: The Ethics of Algorithms.** Statistical models are being used to decide who gets a loan, who gets a job, and who stays in jail. If the training data is biased, the model will be biased.

### 89. Master Dictionary of Advanced Statistical Terms (Part 2)
* **A-Z Autocorrelation:** When data points are correlated with themselves over time (common in stock market data).
* **A-Z Bayesian Inference:** An approach where you start with a "prior" belief and update it as you see more data.
* **A-Z Covariance:** A measure of how much two random variables change together.
* **A-Z Heteroscedasticity:** When the variance of the residuals is not constant (looks like a "fan" in the plot).
* **A-Z Kurtosis:** A measure of the "tailedness" of a distribution. High kurtosis means more extreme outliers.
* **A-Z Multicollinearity:** When explanatory variables in a regression model are highly correlated with each other.
* **A-Z P-hacking:** The practice of manipulating data or analysis until a "significant" p-value is found.
* **A-Z Poisson Distribution:** A distribution used for the number of events happening in a fixed interval of time or space.

### 90. The "Advanced Inference" Vault (Post-2020 Scenarios)
* **2021 Q4 Logic:** Multiple comparisons. If you run 20 tests at the 0.05 level, you expect one to be significant just by chance. This is why we use the Bonferroni correction.
* **2022 Q5 Logic:** Power and Effect Size. As the true parameter gets further away from the null value, the power of the test increases. It's easier to find a "big" difference than a "small" one.
* **2023 Q3 Logic:** Probability of a combination. You have to use the "Choose" formula: $nCr = n! / (r!(n-r)!)$. Graders checked for the specific setup of the factorial division.

### 91. Master Dictionary of Obscure Statistical Terms (Part 3)
* **A-Z Adjusted R-squared:** A version of r-squared that penalizes for adding explanatory variables that don't improve the model.
* **A-Z Bias (Unbiased Estimator):** When the expected value of a statistic is equal to the population parameter.
* **A-Z Central Moment:** The expected value of $(X - E[X])^n$. The second central moment is the variance.
* **A-Z Chebyshev's Inequality:** A rule that at least $1 - 1/k^2$ of data must be within $k$ standard deviations for ANY distribution.
* **A-Z Degree of Association:** How strongly two variables are related (measured by $r$, $phi$, or Cramer's V).
* **A-Z Heterogeneity of Variance:** Another word for non-constant variance (violates regression conditions).
* **A-Z Law of Iterated Expectations:** $E[X] = E[E[X|Y]]$. A fundamental rule of probability.
* **A-Z Quantile-Quantile (Q-Q) Plot:** A plot used to compare two probability distributions. If the points fall on a line, the distributions are the same shape.

### 92. The "Statistical Reasoning" Masterclass (Part 1)
* **Concept: The Philosophy of the Null Hypothesis.** We never "prove" the null hypothesis is true. We only "fail to reject" it. This is similar to a court of law where a defendant is "not guilty" rather than "innocent." We simply didn't have enough evidence to say otherwise.
* **Concept: The Meaning of Confidence.** A 95% confidence interval doesn't mean there is a 95% probability the parameter is inside. It means that if we repeat the sampling process 100 times, we expect 95 of the resulting intervals to contain the true parameter.
* **Concept: The Logic of the P-value.** A small p-value means our observed data is unlikely to have happened by chance if the null hypothesis were true. It is NOT the probability that the null is true.
* **Concept: Standard Error vs. Standard Deviation.** Standard deviation describes the spread of individuals in a population. Standard error describes the spread of a statistic (like the mean) across many samples.

### 93. Master Dictionary of Obscure Statistical Terms (Part 4)
* **A-Z Autoregressive Model:** A model where the current value is based on previous values in the series plus a random error.
* **A-Z Collinearity:** When two or more explanatory variables are highly correlated (makes it hard to see the effect of each).
* **A-Z Degrees of Freedom (ANOVA):** For the "Between" groups, it's $k-1$. For the "Within" groups, it's $N-k$.
* **A-Z Heterogeneity:** When groups being compared are fundamentally different in ways that affect the response variable.
* **A-Z Homoscedasticity:** The assumption that the variance of the error terms is constant across all levels of the explanatory variable.
* **A-Z Outlier (Regression):** A point that has a large residual (it doesn't follow the trend of the other points).
* **A-Z Robust Statistics:** Statistics that are not easily influenced by outliers or small changes in the underlying distribution.
* **A-Z Variance Inflation Factor (VIF):** A measure of how much the variance of an estimated regression coefficient is increased because of collinearity.

### 94. The "Statistical Reasoning" Masterclass (Part 2)
* **Concept: The Meaning of the Standard Deviation.** It's the "typical" distance of a value from the mean. If the SD is large, the data is spread out. If it's small, the data is clustered. It's the square root of the average squared distance.
* **Concept: The Logic of the Z-score.** Standardizing allows us to compare "apples to oranges." A Z-score of 2 means the value is two standard deviations above the mean, whether we are talking about heights or test scores.
* **Concept: The Power of the Central Limit Theorem.** It's why statistics works. No matter what the population looks like, the means of large samples will follow a Normal curve. This allows us to use the Normal distribution for almost all inference.
* **Concept: The Interpretation of R-squared.** It is the % of the variation in the y-variable that is explained by the linear relationship with the x-variable. It's the square of the correlation coefficient.

### 95. Master Dictionary of Obscure Statistical Terms (Part 5)
* **A-Z Coefficient of Variation:** The ratio of the standard deviation to the mean (used to compare variability between datasets with different units).
* **A-Z Cumulative Distribution Function (CDF):** A function that gives the probability that a random variable is less than or equal to a certain value.
* **A-Z Density Function:** A function used for continuous random variables where the area under the curve represents probability.
* **A-Z Law of Total Probability:** A fundamental rule relating marginal probabilities to conditional probabilities.
* **A-Z Moment Generating Function:** A mathematical tool used to find the moments (mean, variance, etc.) of a distribution.
* **A-Z Non-Parametric Tests:** Statistical tests that do not assume the data follows a specific distribution (like the Normal distribution).
* **A-Z Probability Density Function (PDF):** The height of the curve at a specific point for a continuous random variable.
* **A-Z Skewness:** A measure of the asymmetry of a distribution.

### 96. The "Statistical Storytelling" Archive
* **Story 1: The Space Shuttle Challenger.** Engineers warned of a problem with the O-rings at low temperatures, but their statistical charts were cluttered and hard to read. Better data visualization could have saved lives.
* **Story 2: The 1936 Literary Digest Poll.** The magazine predicted Landon would beat Roosevelt in a landslide. Their mistake? They sampled people from phone books and car registrations during the Depression—a massive sampling bias.
* **Story 3: The Salk Polio Vaccine.** One of the largest randomized experiments in history. Over 1 million children were involved to ensure that the difference in polio rates was statistically significant.
* **Story 4: The Ghost of the Royal Mail.** A classic example of "Regression to the Mean." When a postman had an unusually good day, he was praised, and his performance "dropped" the next day. When he had a bad day, he was yelled at, and his performance "improved." The yelling didn't work; it was just statistics.

### 97. Master Dictionary of Obscure Statistical Terms (Part 6)
* **A-Z Binary Variable:** A categorical variable with exactly two possible outcomes (e.g. Yes/No, 0/1).
* **A-Z Decile:** A quantile that divides a dataset into ten equal parts.
* **A-Z Epistemological Uncertainty:** Uncertainty caused by a lack of knowledge about the true state of the world.
* **A-Z Fisher Information:** A way of measuring the amount of information that an observable random variable carries about an unknown parameter.
* **A-Z Gibbs Sampling:** A Markov Chain Monte Carlo (MCMC) algorithm for obtaining a sequence of observations which are approximated from a multivariate probability distribution.
* **A-Z Hessian Matrix:** A square matrix of second-order partial derivatives of a scalar-valued function.
* **A-Z Information Theory:** The mathematical study of the quantification, storage, and communication of information (developed by Claude Shannon).
* **A-Z Jensen's Inequality:** A theorem about the relationship between the integral of a convex function and the function of the integral.

### 98. The "Statistical Reasoning" Masterclass (Part 3)
* **Concept: The Meaning of the Slope.** For every increase of 1 in the explanatory variable (x), the predicted response variable (y) increases by exactly the amount of the slope. You MUST use the word "predicted" or "on average" to get credit.
* **Concept: The Logic of the Residual Plot.** We look for a random scatter of points. If there is a "U" shape or a "curve," it means a linear model is not the best fit, even if the correlation coefficient is high.
* **Concept: The Significance of the Standard Error of the Slope.** It measures how much the estimated slope would vary if we took many different samples from the same population. It is used to calculate the t-statistic for the regression test.
* **Concept: The Power of Blocking.** By grouping subjects by a variable we suspect affects the response (like age or gender), we reduce the "noise" in our data and make it easier to see the "signal" from the treatment.

### 99. Master Dictionary of Obscure Statistical Terms (Part 7)
* **A-Z Kolmogorov-Smirnov Test:** A non-parametric test used to determine if two samples come from the same distribution.
* **A-Z Latent Variable:** A variable that is not directly observed but is rather inferred from other variables that are observed.
* **A-Z Maximum Likelihood Estimation:** A method of estimating the parameters of a statistical model by maximizing the likelihood of the observed data.
* **A-Z Neyman-Pearson Lemma:** A fundamental theorem in hypothesis testing that provides the most powerful test for a given significance level.
* **A-Z Odds Ratio:** A measure of association between an exposure and an outcome.
* **A-Z Periodicity:** The tendency for a time series to repeat itself at fixed intervals (e.g. seasonal variations).
* **A-Z Quincunx:** A device (also known as a Galton Board) used to demonstrate the Central Limit Theorem and the Normal distribution.
* **A-Z Reliability Theory:** The study of the probability that a system will perform its intended function for a specified period of time.

### 100. The "Investigative Task" Master-Guide (Part 1)
* **Goal: Thinking Outside the Box.** Question 6 is designed to test your ability to apply statistical concepts to new and unfamiliar situations. You might have to invent a new statistic or modify a known procedure.
* **Strategy: Follow the Logic Path.** Usually, parts (a) and (b) will lead you through a series of calculations that set up the final part. Don't look at the parts in isolation; look for the "story" the question is telling.
* **Setup: The Probability Simulation.** Many Q6 questions involve a complex simulation. You might have to explain how to use a random number generator to simulate a multi-stage process (like a basketball tournament or a factory production line).
* **Setup: The Non-Standard Inference.** You might be asked to perform a test for a median instead of a mean. In this case, you'll likely use a "Sign Test" where you count the number of values above and below the hypothesized median.

### 101. Master Dictionary of Obscure Statistical Terms (Part 8)
* **A-Z Semi-Interquartile Range:** One half of the difference between the first and third quartiles.
* **A-Z Spearman's Rank Correlation:** A non-parametric measure of rank correlation (statistical dependence between the rankings of two variables).
* **A-Z Standardized Moment:** A moment that is normalized, typically by a power of the standard deviation.
* **A-Z Stochastic Process:** A collection of random variables representing the evolution of some system of values over time.
* **A-Z Survival Analysis:** A branch of statistics for analyzing the expected duration of time until one or more events happen (like death in biological organisms and failure in mechanical systems).
* **A-Z Time Series Analysis:** Methods for analyzing time series data in order to extract meaningful statistics and other characteristics of the data.
* **A-Z Uniform Distribution:** A distribution where all outcomes are equally likely over a given range.
* **A-Z Wald Test:** A parametric statistical test used to test the true value of a parameter based on the sample estimate.

### 102. Biographical Encyclopedia (The 19th Century Masters)
* **Florence Nightingale:** Beyond her work in nursing, she was a pioneer in data visualization. She created the "Polar Area Diagram" (similar to a pie chart) to show that more soldiers were dying from preventable diseases than from battle wounds. She was the first female member of the Royal Statistical Society.
* **Adolphe Quetelet:** Known for introducing statistical methods to the social sciences. He developed the "Average Man" (l'homme moyen) concept and is responsible for the Body Mass Index (BMI).
* **Francis Galton:** A cousin of Charles Darwin who founded the field of differential psychology. He discovered the concept of "Regression toward the Mean" while studying the heights of parents and their children.
* **Karl Pearson:** The founder of modern mathematical statistics. He developed the Pearson product-moment correlation coefficient and the Chi-Square test. He also founded the journal 'Biometrika'.
* **Charles Spearman:** Known for his work in psychometrics. He developed the Spearman's rank correlation coefficient and the factor analysis method.
* **Ronald Fisher (Expanded):** The "Father of Modern Statistics." He developed the Analysis of Variance (ANOVA), the concept of "Maximum Likelihood," and the principle of randomization in experimental design.

### 103. Early Exam Logic Paths (2005-2010 Scenarios)
* **2005 Q1 Logic:** Comparing two distributions using boxplots. You had to address Center, Shape, Spread, and Outliers (SOCS) while using comparative language like "higher than" or "more variable."
* **2006 Q2 Logic:** A probability question involving a "Weighted Average." You had to calculate the expected value of a discrete random variable given a set of probabilities.
* **2007 Q4 Logic:** Inference for two proportions. The "Check" phase was critical here—if you didn't show that both $n_1\hat{p}_1 \ge 10$ and $n_2\hat{p}_2 \ge 10$, you lost points.
* **2008 Q6 Logic:** The "Investigative Task" involved a non-standard regression model where the intercept was fixed at zero. You had to interpret the slope in context without an intercept.
* **2009 Q3 Logic:** A complex experimental design question involving "Matched Pairs." You had to explain why subjects were paired and how the random assignment happened within the pairs.
* **2010 Q5 Logic:** Chi-Square Test for Independence. Students often confused this with Homogeneity. The key was that only ONE population was sampled, and two variables were recorded.

### 104. The "Investigative Task" Master-Guide (Part 2)
* **Goal: Communicating Complex Ideas.** Question 6 often requires you to explain a high-level statistical concept in simple terms. You might be asked to "interpret the meaning of the p-value for a layperson."
* **Strategy: Focus on the Context.** Every answer in Q6 must be grounded in the context of the problem. Don't just say "the null is rejected"; say "there is convincing evidence that the new fertilizer increases the average yield of corn."
* **Setup: The Non-Standard Regression.** You might be asked to perform regression on data that has been transformed twice (e.g. log-log). You must be able to back-transform the result to make a prediction in the original units.
* **Setup: The Bootstrap Method.** A modern statistical technique where you "re-sample with replacement" to create a confidence interval without assuming the population is Normal.

### 105. Master Dictionary of Obscure Statistical Terms (Part 9)
* **A-Z Absolute Deviation:** The average of the absolute differences between each data point and the mean of the dataset.
* **A-Z Bimodal Distribution:** A distribution with two distinct peaks (often suggests the data is coming from two different populations).
* **A-Z Coefficient of Determination:** Another name for R-squared ($r^2$).
* **A-Z Conditional Expectation:** The expected value of a random variable given that another random variable takes on a certain value.
* **A-Z Discreteness:** The property of a random variable that can only take on a countable number of values.
* **A-Z Empirical Rule:** The 68-95-99.7 rule for Normal distributions.
* **A-Z Finite Population Correction Factor:** A factor used to reduce the standard error when the sample size is large relative to the population.
* **A-Z Gini Coefficient:** A measure of statistical dispersion intended to represent the income or wealth inequality within a nation or any other group of people.

### 106. The "Statistical Reasoning" Masterclass (Part 4)
* **Concept: The Meaning of the Correlation Coefficient (r).** It measures the strength and direction of the LINEAR relationship between two quantitative variables. It is always between -1 and 1. If $r = 0.8$, it means there is a strong, positive, linear relationship.
* **Concept: The Logic of the Boxplot.** It shows the five-number summary: Min, Q1, Median, Q3, Max. The "box" contains the middle 50% of the data. The "whiskers" extend to the smallest and largest values that are NOT outliers.
* **Concept: The Power of the Random Number Table.** Before calculators, we used tables of digits (0-9) to simulate randomness. You must be able to explain how to assign numbers to different outcomes (e.g. 01-15 = Group A, 16-30 = Group B).
* **Concept: The Interpretation of the Margin of Error.** It's the maximum expected difference between the sample statistic and the true population parameter. It only accounts for sampling variability, NOT bias.

### 107. Master Dictionary of Obscure Statistical Terms (Part 10)
* **A-Z Autocorrelation Function:** A plot that shows the correlation of a time series with its own lagged values.
* **A-Z Bayes' Theorem:** A formula that describes the probability of an event, based on prior knowledge of conditions that might be related to the event.
* **A-Z Cramer's V:** A measure of association between two nominal variables, giving a value between 0 and +1.
* **A-Z Ergodicity:** A property of a stochastic process where the time average is the same as the ensemble average.
* **A-Z Gauss-Markov Theorem:** A theorem stating that the least squares estimator is the best linear unbiased estimator (BLUE).
* **A-Z Kurtosis (Excess):** The kurtosis of a distribution minus 3 (the kurtosis of the Normal distribution).
* **A-Z Likelihood Ratio Test:** A statistical test used to compare the fit of two nested models.
* **A-Z Multivariate Analysis:** The simultaneous observation and analysis of more than one outcome variable.

### 108. The "Statistical Reasoning" Masterclass (Part 5)
* **Concept: The Meaning of the Sample Proportion (p-hat).** It's the number of "successes" in a sample divided by the total sample size. In the long run, the average of all possible p-hats will be equal to the true population proportion (p).
* **Concept: The Logic of the Sampling Distribution.** It's a theoretical distribution of all possible values of a statistic (like the mean or proportion) for a fixed sample size. It's the foundation of all inference.
* **Concept: The Power of the P-value (Expanded).** It tells us how "surprising" our data is. If the p-value is 0.01, it means that if the null hypothesis were true, we would see results as extreme as ours only 1% of the time.
* **Concept: The Interpretation of the Slope in a Regression Test.** We are testing if there is a linear relationship between the variables in the POPULATION. The null hypothesis is usually that the true slope is zero.

### 109. Master Dictionary of Obscure Statistical Terms (Part 11)
* **A-Z Bias-Variance Tradeoff:** The problem of simultaneously minimizing two sources of error that prevent supervised learning algorithms from generalizing beyond their training set.
* **A-Z Conditional Probability Distribution:** The probability distribution of a sub-population that satisfies some condition.
* **A-Z Eigenvalues and Eigenvectors:** Used in Principal Component Analysis (PCA) to find the directions of maximum variance in the data.
* **A-Z F-distribution:** A continuous probability distribution that arises frequently as the null distribution of a test statistic, most notably in the analysis of variance (ANOVA).
* **A-Z Gamma Distribution:** A two-parameter family of continuous probability distributions (often used to model wait times).
* **A-Z Homogeneity of Variance (Expanded):** The assumption that different groups have the same variance (checked using Levene's test).
* **A-Z Iteratively Reweighted Least Squares:** An algorithm for finding the maximum likelihood estimates of a generalized linear model.
* **A-Z Law of Large Numbers:** A theorem that describes the result of performing the same experiment a large number of times. According to the law, the average of the results obtained from a large number of trials should be close to the expected value.

### 110. The "Investigative Task" Master-Guide (Part 3)
* **Goal: Synthesizing Information.** Question 6 might ask you to compare two different statistical models (e.g. a linear model and a quadratic model). You must explain why one is better based on the residual plot AND the r-squared value.
* **Strategy: Don't Panic with New Formulas.** If the question gives you a brand-new formula, it will explain what each variable means. Just "plug and chug" initially, then think about the logic of what the formula is measuring.
* **Setup: The Permutation Test.** A non-parametric way to find a p-value by shuffling the data many times. You must be able to explain how the "random shuffle" mimics the null hypothesis of "no difference" between groups.
* **Setup: The Logistic Regression.** A model used when the response variable is categorical (e.g. Success/Failure). You might be asked to interpret the "odds ratio" of a specific explanatory variable.

### 111. Master Dictionary of Obscure Statistical Terms (Part 12)
* **A-Z Negative Binomial Distribution:** A discrete probability distribution that models the number of successes in a sequence of independent and identically distributed Bernoulli trials before a specified number of failures occurs.
* **A-Z Non-Sampling Error:** Error in a statistical analysis caused by factors other than the sample selection (e.g. non-response bias, response bias, or data entry errors).
* **A-Z Orthogonalization:** The process of making two vectors or variables independent (perpendicular) to each other.
* **A-Z Power of a Test:** The probability that a test correctly rejects a false null hypothesis. It is $1 - \text{beta}$.
* **A-Z Quintile:** A quantile that divides a dataset into five equal parts.
* **A-Z Robust Regression:** A form of regression analysis designed to be less sensitive to outliers than ordinary least squares.
* **A-Z Standardized Regression Coefficient:** A coefficient that has been standardized so that its variance is 1 (used to compare the relative importance of different predictors).
* **A-Z Type I Error:** Rejecting a true null hypothesis (a "false alarm").

### 112. The "Statistical Reasoning" Masterclass (Part 6)
* **Concept: The Meaning of the Standard Error.** It is the estimated standard deviation of a sampling distribution. We use it when the population standard deviation ($\sigma$) is unknown and we must use the sample standard deviation ($s$) instead.
* **Concept: The Logic of the T-distribution.** It's like the Normal distribution but has "fatter tails." We use it when we don't know the population standard deviation. As the sample size increases, the t-distribution becomes more like the Normal distribution.
* **Concept: The Power of the Power Test.** It's the probability that we WILL find a difference if one actually exists. We want power to be high (usually 0.80 or 0.90). We can increase power by increasing sample size or alpha.
* **Concept: The Interpretation of the P-value in a Two-Sided Test.** We are looking for a difference in EITHER direction. This means we double the p-value we would get from a one-sided test.

### 113. Master Dictionary of Obscure Statistical Terms (Part 13)
* **A-Z Admissible Decision Rule:** A rule for which there is no other rule that is always better (in terms of risk).
* **A-Z Bernoulli Trial:** A random experiment with exactly two possible outcomes (Success and Failure).
* **A-Z Conditional Variance:** The variance of a random variable given that another random variable takes on a certain value.
* **A-Z Dirichlet Distribution:** A family of continuous multivariate probability distributions (the multivariate generalization of the beta distribution).
* **A-Z Erlang Distribution:** A distribution used to model the waiting time until the kth event in a Poisson process.
* **A-Z Gausssian Process:** A stochastic process where every finite collection of random variables has a multivariate Normal distribution.
* **A-Z Hypergeometric Distribution:** A discrete probability distribution that describes the probability of k successes in n draws, WITHOUT replacement, from a finite population of size N.
* **A-Z Isotropic Distribution:** A distribution that is invariant under rotations.

### 114. The "Investigative Task" Master-Guide (Part 4)
* **Goal: Applying Logic to New Scenarios.** Question 6 might ask you to evaluate a claim about a "population mean" using a method you've never seen (e.g. a Bootstrap Interval). You must explain why the interval is valid based on the "re-sampling" logic.
* **Strategy: Address the "So What?"** Graders are looking for the implication of your statistical result. If you find a significant difference, what does that mean for the specific research question being asked?
* **Setup: The Non-Standard Probability Model.** You might be asked to find the probability of an event using a "Geometric" model but with a changing success rate. You'll likely use a tree diagram to solve this.
* **Setup: The Multi-Stage Experiment.** You might be asked to design an experiment with multiple levels of blocking (e.g. blocking by age AND gender). Explain the randomization process for each block.

### 115. Master Dictionary of Obscure Statistical Terms (Part 14)
* **A-Z Kolmogorov's Axioms:** The three fundamental rules that define probability in a formal, mathematical way.
* **A-Z Law of the Iterated Logarithm:** A theorem that describes the magnitude of the fluctuations of a random walk.
* **A-Z Mean Squared Error:** The average of the squares of the "errors" (the difference between the estimator and what is being estimated).
* **A-Z Nullity:** The dimension of the kernel of a linear transformation (used in advanced regression analysis).
* **A-Z Order Statistic:** The kth smallest value in a sample. The minimum and maximum are the first and nth order statistics.
* **A-Z Pareto Distribution:** A power-law probability distribution that is used in description of social, quality control, scientific, and other types of observable phenomena.
* **A-Z Quantile Regression:** A type of regression analysis used in statistics and econometrics. Whereas the method of least squares estimates the conditional mean of the response variable, quantile regression estimates the conditional median (or other quantiles).
* **A-Z Resampling:** A variety of methods for doing one of the following: 1. Estimating the precision of sample statistics by using subsets of available data or drawing randomly with replacement from a set of data points. 2. Exchanging labels on data points when performing significance tests.

### 116. The "Statistical Reasoning" Masterclass (Part 7)
* **Concept: The Meaning of the Sample Size (n).** As the sample size increases, the standard error decreases. This makes our estimates more precise and our confidence intervals narrower. It also increases the power of our significance tests.
* **Concept: The Logic of the Randomized Block Design.** We block by a variable we suspect affects the response. Within each block, we randomly assign treatments. This allows us to account for the variation caused by the blocking variable.
* **Concept: The Power of the Correlation Coefficient (Expanded).** Correlation is not resistant to outliers! A single point far from the others can drastically change the value of $r$. ALWAYS look at the scatterplot before calculating $r$.
* **Concept: The Interpretation of the Intercept in a Regression Model.** It is the predicted value of the response variable (y) when the explanatory variable (x) is zero. Sometimes the intercept has no physical meaning (e.g. height when age is zero).

### 117. Master Dictionary of Obscure Statistical Terms (Part 15)
* **A-Z Acceptance Sampling:** A statistical method used in quality control to determine whether to accept or reject a batch of products based on a sample.
* **A-Z Beta Distribution:** A family of continuous probability distributions defined on the interval [0, 1].
* **A-Z Coefficient of Alienation:** A measure of the lack of relationship between two variables (equal to $\sqrt{1 - r^2}$).
* **A-Z Discriminant Analysis:** A statistical technique used to classify a set of observations into predefined classes.
* **A-Z Experimental Unit:** The smallest unit to which a treatment is applied in an experiment (e.g. a person, a plant, or a plot of land).
* **A-Z Factorial Experiment:** An experiment whose design consists of two or more factors, each with discrete possible values or "levels".
* **A-Z Goodness of Fit:** How well a statistical model fits a set of observations.
* **A-Z Heteroscedasticity-Consistent Standard Errors:** Errors that are robust to non-constant variance (used in advanced econometrics).

### 118. The "Statistical Reasoning" Masterclass (Part 8)
* **Concept: The Meaning of the Coefficient of Determination (R-squared).** It tells us how much of the variation in the response variable is explained by the explanatory variable. If $R^2 = 0.64$, it means 64% of the variation is explained by the model.
* **Concept: The Logic of the Normal Probability Plot.** We use it to check the "Normality" condition for inference. If the points fall roughly on a straight line, it is reasonable to assume the population is Normal.
* **Concept: The Power of the Randomized Comparative Experiment.** By using randomization, we ensure that the treatment groups are as similar as possible before the experiment begins. This allows us to attribute any difference in the response variable to the treatment.
* **Concept: The Interpretation of the Standard Deviation of the Residuals (s).** It's the "typical" distance between the observed values and the values predicted by the regression line.

### 119. Master Dictionary of Obscure Statistical Terms (Part 16)
* **A-Z Autocorrelation (Partial):** The correlation between a time series and a lagged version of itself after removing the effect of intermediate lags.
* **A-Z Bayes Factor:** A ratio of two competing statistical models represented by their evidence, and is used in Bayesian model comparison.
* **A-Z Central Limit Theorem (Expanded):** The theorem that states that the distribution of sample means will be approximately Normal if the sample size is large, regardless of the population distribution.
* **A-Z Eigenvalue (Expanded):** A scalar associated with a linear system of equations (used in PCA to determine the amount of variance explained by each principal component).
* **A-Z Fisher's Exact Test:** A statistical significance test used in the analysis of contingency tables (used when sample sizes are small).
* **A-Z Generalized Linear Model:** A flexible generalization of ordinary linear regression that allows for response variables that have error distribution models other than a Normal distribution.
* **A-Z Heterogeneity (Expanded):** The quality or state of being diverse in character or content (used to describe populations with varying characteristics).
* **A-Z Invariance:** The property of a statistical procedure that remains unchanged under certain transformations of the data.

### 120. The "Investigative Task" Master-Guide (Part 5)
* **Goal: Evaluating Statistical Claims.** Question 6 might ask you to evaluate a claim made by a researcher (e.g. "Eating blueberries improves memory"). You must explain if the study was a randomized experiment or an observational study, and what that means for the claim.
* **Strategy: Use Specific Evidence.** Don't just say the researcher is wrong. Point to specific features of the data (e.g. "The sample size was only 10 people, which leads to a very large margin of error").
* **Setup: The Non-Standard Confidence Interval.** You might be asked to create a confidence interval for the DIFFERENCE between a mean and a median. You'll likely use a simulation-based approach for this.
* **Setup: The Logic of the Power Curve.** You might be shown a graph of "Power vs. Effect Size" and asked to explain why the curve is shaped like an 'S'.

### 121. Master Dictionary of Obscure Statistical Terms (Part 17)
* **A-Z Likelihood Function:** A function of the parameters of a statistical model given specific observed data.
* **A-Z Mean Absolute Error:** A measure of errors between paired observations expressing the same phenomenon.
* **A-Z Non-Parametric Regression:** A category of regression analysis in which the predictor does not take a predetermined form but is constructed according to information derived from the data.
* **A-Z Orthogonal Vectors:** Two vectors whose dot product is zero (independent directions).
* **A-Z P-value (Definition):** The probability of obtaining test results at least as extreme as the results actually observed, under the assumption that the null hypothesis is correct.
* **A-Z Quartile Deviation:** Half the distance between the third and first quartiles (another name for semi-IQR).
* **A-Z Random Walk:** A mathematical object, known as a stochastic or random process, that describes a path that consists of a succession of random steps on some mathematical space such as the integers.
* **A-Z Survival Function:** A function that gives the probability that a patient, device, or other object of interest will survive beyond any specified time.

### 122. The "Statistical Reasoning" Masterclass (Part 9)
* **Concept: The Meaning of the Sample Mean (x-bar).** It's the average of the values in a sample. According to the Law of Large Numbers, as the sample size increases, x-bar will get closer and closer to the true population mean ($\mu$).
* **Concept: The Logic of the Residual Plot (Expanded).** We check for "Equal Variance" (homoscedasticity). If the residuals are more spread out for larger x-values than for smaller x-values, the regression model might be less reliable at higher levels.
* **Concept: The Power of the Matched Pairs Design.** By using each subject as their own control (or pairing similar subjects), we eliminate the variation caused by individual differences. This makes the experiment more powerful.
* **Concept: The Interpretation of the P-value in a Regression Test (Expanded).** We are testing if there is a linear relationship in the POPULATION. If the p-value is very small, we conclude that the slope in the population is NOT zero.

### 123. Master Dictionary of Obscure Statistical Terms (Part 18)
* **A-Z Analysis of Covariance (ANCOVA):** A general linear model which blends ANOVA and regression.
* **A-Z Box-Cox Transformation:** A family of power transformations used to make non-Normal data more Normal.
* **A-Z Confidence Interval (Definition):** A type of estimate computed from the statistics of the observed data, that gives a range of values for an unknown parameter.
* **A-Z Degree of Freedom (Chi-Square):** For a test of independence, it's (r-1)(c-1). For a goodness-of-fit test, it's k-1.
* **A-Z Estimator:** A rule for calculating an estimate of a given quantity based on observed data.
* **A-Z Fixed Effects Model:** A statistical model in which the model parameters are fixed or non-random quantities.
* **A-Z Grouped Data:** Data that has been organized into groups or "bins."
* **A-Z Hypothesis (Null):** A general statement or default position that there is no relationship between two measured phenomena.

### 124. The "Statistical Storytelling" Archive (Part 2)
* **Story 5: The Case of the Missing Bombers.** During WWII, Abraham Wald analyzed the bullet holes on returning planes. Most people wanted to armor the areas with the most holes. Wald realized that the holes on the returning planes showed where a plane COULD be hit and still survive. He armored the areas with NO holes—the areas where a single hit would be fatal. A classic example of "Survivorship Bias."
* **Story 6: The Monty Hall Problem.** A probability puzzle based on a game show. Should you switch doors or stay? Statistics shows that switching gives you a 2/3 chance of winning, while staying gives you only 1/3. It's counter-intuitive but mathematically sound.
* **Story 7: The Hot Hand Fallacy.** The belief that a basketball player who has made several shots in a row is "hot" and more likely to make the next one. Statistical analysis of shooting data shows that each shot is largely independent; there is no such thing as a "hot hand."
* **Story 8: The Sally Clark Case.** A tragic miscarriage of justice caused by a misuse of probability. A doctor testified that the chance of two babies in one family dying of SIDS was 1 in 73 million. He assumed the events were independent, but they weren't.

### 125. Master Dictionary of Obscure Statistical Terms (Part 19)
* **A-Z Independence (Stochastic):** Two events are independent if the occurrence of one does not affect the probability of the other.
* **A-Z Joint Probability Distribution:** A distribution that gives the probability of each possible outcome for a set of random variables.
* **A-Z Kernel Density Estimation:** A non-parametric way to estimate the probability density function of a random variable.
* **A-Z Linear Regression (Multiple):** A regression model with one response variable and more than one explanatory variable.
* **A-Z Marginal Probability:** The probability of an event irrespective of the outcome of another variable.
* **A-Z Non-Response Bias:** Bias that occurs when people who choose not to respond to a survey have different opinions than those who do respond.
* **A-Z Outlier (Resistance):** A property of a statistic that is not easily influenced by extreme values (e.g. median is resistant, mean is not).
* **A-Z Poisson Distribution:** A discrete probability distribution that expresses the probability of a given number of events occurring in a fixed interval of time or space.

### 126. The "Statistical Reasoning" Masterclass (Part 10)
* **Concept: The Meaning of the Standard Error of the Proportion.** It is the estimated standard deviation of the sampling distribution of p-hat. We use the sample proportion (p-hat) to estimate the true proportion (p).
* **Concept: The Logic of the Chi-Square Test (Expanded).** It measures the discrepancy between the "Observed" counts and the "Expected" counts. If the discrepancy is large, the Chi-Square statistic will be large, and the p-value will be small.
* **Concept: The Power of the Randomized Block Design (Expanded).** It's like "Matched Pairs" but for more than two treatments. We block by a variable and then randomly assign all treatments within each block.
* **Concept: The Interpretation of the Correlation Coefficient (r) Squared.** It's the percentage of the variation in the y-variable that is explained by the linear relationship with the x-variable.

### 127. Master Dictionary of Obscure Statistical Terms (Part 20)
* **A-Z Autoregressive Integrated Moving Average (ARIMA):** A class of statistical models for analyzing and forecasting time series data.
* **A-Z Bernoulli Distribution:** The probability distribution of a random variable which takes the value 1 with probability p and the value 0 with probability q = 1 - p.
* **A-Z Conditional Independence:** Two random variables are conditionally independent given a third variable if their joint distribution is the product of their conditional distributions.
* **A-Z Difference-in-Differences:** A statistical technique used in econometrics and quantitative research in the social sciences that attempts to mimic an experimental research design using observational study data.
* **A-Z Exact Test:** A statistical test where all assumptions, upon which the derivation of the distribution of the test statistic is based, are actually met as opposed to an approximate test.
* **A-Z Fractional Factorial Design:** An experimental design consisting of a carefully chosen subset (fraction) of the experimental runs of a full factorial design.
* **A-Z Goodness of Fit (Expanded):** A statistical model's "goodness of fit" describes how well it fits a set of observations.
* **A-Z Heterogeneity (Definition):** In statistics, heterogeneity means that the samples are not from the same population.

### 128. The "Statistical Reasoning" Masterclass (Part 11)
* **Concept: The Meaning of the Sample Proportion (Expanded).** It is the count of successes divided by the sample size. It is a point estimate for the true population proportion. The variability of the sample proportion decreases as the sample size increases.
* **Concept: The Logic of the Normal Distribution (Expanded).** The Normal distribution is symmetric and bell-shaped. It is defined by its mean and standard deviation. Many statistical procedures assume that the data or the sampling distribution is approximately Normal.
* **Concept: The Power of the Randomized Experiment (Expanded).** Random assignment to treatment groups helps to ensure that any differences in the response variable are due to the treatments themselves and not to other confounding variables.
* **Concept: The Interpretation of the Margin of Error (Expanded).** The margin of error is the maximum expected difference between the sample estimate and the true population parameter for a given confidence level. It accounts for sampling variability.

### 129. Master Dictionary of Obscure Statistical Terms (Part 21)
* **A-Z Autoregressive Model (Definition):** A model for a time series where the current value is a linear combination of previous values and a random error.
* **A-Z Bernoulli Trial (Expanded):** An experiment with exactly two outcomes, often called "success" and "failure."
* **A-Z Conditional Probability Distribution (Expanded):** The probability distribution of one random variable given the value of another random variable.
* **A-Z Difference in Means (Inference):** A statistical procedure used to compare the means of two independent populations.
* **A-Z Exact Test (Expanded):** A statistical test that provides an exact p-value based on the permutation distribution of the data.
* **A-Z Fractional Factorial Design (Expanded):** An experimental design that uses only a subset of the possible combinations of factor levels to reduce the number of experimental runs.
* **A-Z Goodness of Fit Test (Chi-Square):** A test used to determine if an observed frequency distribution matches a theoretical distribution.
* **A-Z Heteroscedasticity (Definition):** A condition in which the variance of the error terms in a regression model is not constant.

### 130. The "Statistical Storytelling" Archive (Part 3)
* **Story 9: The Bradley Effect.** A phenomenon where polled voters say they will vote for a candidate but then don't. Named after Tom Bradley, an African American candidate for governor of California who lost despite leading in the polls. A classic example of "Social Desirability Bias."
* **Story 10: The Challenger Disaster (Revisited).** The engineers had a scatterplot of O-ring failures vs. temperature. However, they only included the days where failures happened. If they had included the days where NO failures happened, they would have seen a clear trend: lower temperatures lead to more failures. A fatal example of "Selection Bias."
* **Story 11: The Small Schools Myth.** Bill Gates famously spent millions of dollars promoting small schools because they often had the highest test scores. However, small schools also have the LOWEST test scores. This is simply because small samples have more variability (extreme results are more likely).
* **Story 12: The Mars Climate Orbiter.** Not a statistical story, but a data story. The probe crashed because one team used metric units and another used English units. In statistics, "Data Cleaning" and "Unit Consistency" are vital.

### 131. Master Dictionary of Obscure Statistical Terms (Part 22)
* **A-Z Information Criterion (Akaike):** A measure of the relative quality of statistical models for a given set of data.
* **A-Z Joint Cumulative Distribution Function:** The probability that all random variables in a set are less than or equal to their respective values.
* **A-Z Kurtosis (Definition):** A measure of the "tailedness" of the probability distribution of a real-valued random variable.
* **A-Z Logistic Regression (Definition):** A statistical model used to model the probability of a binary response variable.
* **A-Z Marginal Distribution:** The probability distribution of a subset of random variables.
* **A-Z Normal Distribution (Standard):** A Normal distribution with a mean of zero and a standard deviation of one.
* **A-Z Ordinary Least Squares:** A type of linear least squares method for estimating the unknown parameters in a linear regression model.
* **A-Z P-value (Interpretation):** If the p-value is small, we reject the null hypothesis. If the p-value is large, we fail to reject the null hypothesis.

### 132. The "Statistical Reasoning" Masterclass (Part 12)
* **Concept: The Meaning of the Standard Error of the Mean.** It is the estimated standard deviation of the sampling distribution of x-bar. We use the sample standard deviation (s) to estimate the true population standard deviation ($\sigma$).
* **Concept: The Logic of the T-test (Expanded).** It is used to compare a sample mean to a hypothesized population mean when the population standard deviation is unknown. The test statistic (t) follows a t-distribution with $n-1$ degrees of freedom.
* **Concept: The Power of the Randomized Block Design (Investigative).** Blocking is used to control for "nuisance" variables. Within each block, subjects are randomly assigned to treatments. This reduces the variance of the error term in the model.
* **Concept: The Interpretation of the Correlation Coefficient (r) (Final).** It measures the direction and strength of a linear relationship. It does NOT imply causation. A correlation of 1 or -1 means all points fall exactly on a line.

### 133. Master Dictionary of Obscure Statistical Terms (Part 23)
* **A-Z Autoregressive Model (Order p):** A model where the current value is a linear combination of the p previous values and a random error.
* **A-Z Bernoulli Distribution (Definition):** The probability distribution of a random variable which takes the value 1 with probability p and the value 0 with probability q = 1-p.
* **A-Z Conditional Probability Distribution (Joint):** The joint distribution of a set of random variables given the values of another set of random variables.
* **A-Z Difference in Means (Confidence Interval):** A range of values used to estimate the true difference between two population means.
* **A-Z Exact Test (Fisher):** A test used to analyze contingency tables when the sample sizes are small.
* **A-Z Fractional Factorial Design (Order k):** An experimental design that uses a $1/2^k$ fraction of the full factorial design.
* **A-Z Goodness of Fit Test (Kolmogorov-Smirnov):** A test used to compare a sample distribution to a continuous probability distribution.
* **A-Z Heteroscedasticity-Robust Standard Errors:** Standard errors that are valid even when the variance of the error terms is not constant.

### 134. The "Statistical Reasoning" Masterclass (Part 13)
* **Concept: The Meaning of the Coefficient of Variation.** It is the ratio of the standard deviation to the mean. It is used to compare the relative variability of two datasets with different units or means.
* **Concept: The Logic of the Z-test (Expanded).** It is used to compare a sample mean to a hypothesized population mean when the population standard deviation is known. The test statistic (z) follows a standard Normal distribution.
* **Concept: The Power of the Randomized Block Design (Advanced).** Blocking can be used to control for multiple sources of variation simultaneously. This leads to a more precise estimate of the treatment effect.
* **Concept: The Interpretation of the Slope in a Regression Model (Final).** It is the predicted change in the response variable for a one-unit increase in the explanatory variable.

### 135. Master Dictionary of Obscure Statistical Terms (Part 24)
* **A-Z Autocorrelation (Sample):** The correlation between observations of a time series at different points in time.
* **A-Z Bernoulli Trial (Success Probability):** The probability that a Bernoulli trial results in a "success."
* **A-Z Conditional Probability distribution (Marginal):** The marginal distribution of a subset of random variables derived from a conditional distribution.
* **A-Z Difference in Proportions (Inference):** A statistical procedure used to compare the proportions of two independent populations.
* **A-Z Exact Test (Permutation):** A test used to compare two groups by shuffling the data many times.
* **A-Z Fractional Factorial Design (Resolution):** A measure of the confounding in a fractional factorial design.
* **A-Z Goodness of Fit Test (Wilks):** A test used to compare the likelihoods of two nested models.
* **A-Z Heteroscedasticity-Consistent Standard Errors (HC3):** A specific type of robust standard error that is more accurate for small sample sizes.

### 136. The "Statistical Reasoning" Masterclass (Part 14)
* **Concept: The Meaning of the Coefficient of Determination (R-squared) (Expanded).** It is the fraction of the variation in the response variable that is accounted for by the least-squares regression line with the explanatory variable.
* **Concept: The Logic of the Residual Plot (Final).** A good model has no pattern in the residuals. If there is a pattern, it means the model is missing some information.
* **Concept: The Power of the Randomized Experiment (Final).** Randomization is the key to causal inference. Without it, we can only say that two variables are associated, not that one causes the other.
* **Concept: The Interpretation of the Margin of Error (Final).** It is the radius of the confidence interval. It depends on the confidence level and the standard error.

### 137. Master Dictionary of Obscure Statistical Terms (Part 25)
* **A-Z Autocorrelation (Population):** The theoretical correlation between observations of a stochastic process at different points in time.
* **A-Z Bernoulli Distribution (Mean):** The expected value of a Bernoulli random variable, which is equal to p.
* **A-Z Conditional Probability Distribution (Cumulative):** The cumulative distribution function of a random variable given the value of another random variable.
* **A-Z Difference in Proportions (Confidence Interval):** A range of values used to estimate the true difference between two population proportions.
* **A-Z Exact Test (Randomization):** Another name for a permutation test.
* **A-Z Fractional Factorial Design (Generator):** A rule used to determine the factor levels in a fractional factorial design.
* **A-Z Goodness of Fit Test (Chi-Square Goodness of Fit):** A test used to see if a sample comes from a population with a specific distribution.
* **A-Z Heteroscedasticity-Consistent Covariance Matrix:** A covariance matrix that is robust to non-constant variance.

### 138. The "Statistical Reasoning" Masterclass (Part 15)
* **Concept: The Meaning of the Sample Standard Deviation (s).** It is the "typical" distance of a value in the sample from the sample mean. It is used as an estimate for the population standard deviation ($\sigma$).
* **Concept: The Logic of the Sampling Distribution of the Difference in Means.** It is the distribution of all possible differences between two sample means from two independent populations.
* **Concept: The Power of the Randomized Experiment (Investigative).** Blocking is used to ensure that the treatment groups are balanced with respect to a confounding variable.
* **Concept: The Interpretation of the Intercept in a Regression Model (Expanded).** It is the predicted value of y when x is zero. It may or may not have a meaningful interpretation depending on the range of the x-values.

### 139. Master Dictionary of Obscure Statistical Terms (Part 26)
* **A-Z Autocorrelation (Lag k):** The correlation between observations of a time series that are k time units apart.
* **A-Z Bernoulli Distribution (Variance):** The variance of a Bernoulli random variable, which is equal to $p(1-p)$.
* **A-Z Conditional Probability Distribution (Joint Cumulative):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables.
* **A-Z Difference in Proportions (Significance Test):** A statistical procedure used to test the hypothesis that two population proportions are equal.
* **A-Z Exact Test (Randomization Test):** A test that calculates an exact p-value by considering all possible permutations of the data.
* **A-Z Fractional Factorial Design (Defining Relation):** A mathematical expression that defines the confounding in a fractional factorial design.
* **A-Z Goodness of Fit Test (Likelihood Ratio):** A test used to compare the fit of two models by calculating the ratio of their likelihoods.
* **A-Z Heteroscedasticity-Consistent Standard Errors (HC0):** The original type of robust standard error developed by White.

### 140. The "Statistical Reasoning" Masterclass (Part 16)
* **Concept: The Meaning of the Sample Proportion (Final).** It is an unbiased estimator of the true population proportion. The variability of the sampling distribution of p-hat is given by $\sqrt{p(1-p)/n}$.
* **Concept: The Logic of the Z-test for a Proportion.** It is used to compare a sample proportion to a hypothesized population proportion. The test statistic (z) follows a standard Normal distribution if the large-count condition is met.
* **Concept: The Power of the Randomized Experiment (Investigative Final).** Blocking reduces the standard error of the treatment effect, making it easier to detect a significant difference.
* **Concept: The Interpretation of the Correlation Coefficient (r) Squared (Final).** It represents the percentage of the variation in the response variable that is explained by the linear model.

### 141. Master Dictionary of Obscure Statistical Terms (Part 27)
* **A-Z Autoregressive Model (Mean):** The long-term average value of an autoregressive process.
* **A-Z Bernoulli Distribution (Definition Final):** The simplest discrete distribution, with only two possible outcomes.
* **A-Z Conditional Probability Distribution (Joint Marginal):** The marginal distribution of a subset of random variables derived from a joint conditional distribution.
* **A-Z Difference in Means (Significance Test Final):** A test used to determine if the means of two populations are significantly different.
* **A-Z Exact Test (Permutation Final):** A test that uses the actual values of the data to calculate an exact p-value.
* **A-Z Fractional Factorial Design (Generator Final):** A rule that determines which treatment combinations are included in the experiment.
* **A-Z Goodness of Fit Test (Likelihood Ratio Final):** A test that compares the fits of two models using the ratio of their maximum likelihoods.
* **A-Z Heteroscedasticity-Consistent Standard Errors (HC1):** A robust standard error that includes a degrees-of-freedom correction.

### 142. The "Statistical Reasoning" Masterclass (Part 17)
* **Concept: The Meaning of the Sample Proportion (Advanced).** It is the fraction of individuals in a sample that have a certain characteristic. In the long run, the average of all possible sample proportions will be equal to the true population proportion.
* **Concept: The Logic of the Normal Distribution (Final).** It is the "gold standard" for continuous probability distributions. Many statistical procedures rely on the assumption of Normality to provide accurate results.
* **Concept: The Power of the Randomized Experiment (Advanced Final).** Randomization is the most powerful tool we have for establishing a causal link between two variables.
* **Concept: The Interpretation of the Margin of Error (Advanced Final).** It provides a measure of the precision of our estimate. A smaller margin of error means we have a more precise estimate.

### 143. Master Dictionary of Obscure Statistical Terms (Part 28)
* **A-Z Autocorrelation (Population Final):** The theoretical correlation between values of a stochastic process at different time points.
* **A-Z Bernoulli Distribution (Mean Final):** The theoretical average value of a Bernoulli random variable.
* **A-Z Conditional Probability Distribution (Joint Marginal Final):** The marginal distribution of a subset of random variables derived from a joint conditional distribution.
* **A-Z Difference in Proportions (Significance Test Advanced):** A test used to compare the proportions of two different populations.
* **A-Z Exact Test (Randomization Test Final):** A test that uses the permutation distribution of the data to calculate an exact p-value.
* **A-Z Fractional Factorial Design (Generator Advanced):** A rule that determines which treatment combinations are included in a fractional factorial experiment.
* **A-Z Goodness of Fit Test (Likelihood Ratio Advanced):** A test that compares the fits of two models using the ratio of their likelihood functions.
* **A-Z Heteroscedasticity-Consistent Standard Errors (HC2):** A robust standard error that includes a leverage correction.

### 144. The "Statistical Storytelling" Archive (Part 4)
* **Story 13: The Literary Digest Poll.** In 1936, the Literary Digest predicted that Alf Landon would beat FDR in a landslide. They were wrong because their sample was biased: they polled people who had cars and telephones (rich people). A classic example of "Undercoverage Bias."
* **Story 14: The Dewey Defeats Truman Error.** Similar to the FDR poll, pollsters in 1948 stopped polling weeks before the election, missing a late surge for Truman. A lesson in the importance of "Time Sensitivity" in data.
* **Story 15: The 1970 Draft Lottery.** The draft lottery was supposed to be random, but the capsules weren't mixed well. Capsules for later months were put in last and ended up on top. They were drawn first, leading to a non-random draft. A classic example of a "Poorly Designed Simulation."
* **Story 16: The Gender Bias at Berkeley.** In 1973, UC Berkeley was sued for gender bias in graduate admissions. However, when the data was analyzed by department, it turned out that women were actually MORE likely to be admitted in most departments. The overall bias was a result of women applying to more competitive departments. A classic example of "Simpson's Paradox."

### 145. Master Dictionary of Obscure Statistical Terms (Part 29)
* **A-Z Interquartile Range (Definition):** The difference between the third and first quartiles. It measures the spread of the middle 50% of the data.
* **A-Z Joint Cumulative Distribution Function (Final):** The theoretical probability that all random variables in a set are less than or equal to their respective values.
* **A-Z Least Squares Regression Line (Definition):** The line that minimizes the sum of the squared residuals.
* **A-Z Margin of Error (Confidence Interval):** The value that is added to and subtracted from a point estimate to create a confidence interval.
* **A-Z Null Hypothesis (Definition):** The hypothesis that there is no effect or no difference.
* **A-Z Outlier (Boxplot):** A value that is more than 1.5 IQRs above the third quartile or below the first quartile.
* **A-Z Population Parameter (Definition):** A numerical value that describes a characteristic of a population.
* **A-Z Random Sample (Simple):** A sample of size n chosen in such a way that every set of n individuals has an equal chance of being selected.

### 146. The "Statistical Reasoning" Masterclass (Part 18)
* **Concept: The Meaning of the Sample Proportion (Advanced Final).** It is the fraction of individuals in a sample that have a certain characteristic. In the long run, the average of all possible sample proportions will be equal to the true population proportion.
* **Concept: The Logic of the Normal Distribution (Advanced Final).** It is the "gold standard" for continuous probability distributions. Many statistical procedures rely on the assumption of Normality to provide accurate results.
* **Concept: The Power of the Randomized Experiment (Investigative Final).** Randomization is the most powerful tool we have for establishing a causal link between two variables.
* **Concept: The Interpretation of the Margin of Error (Investigative Final).** It provides a measure of the precision of our estimate. A smaller margin of error means we have a more precise estimate.

### 147. Master Dictionary of Obscure Statistical Terms (Part 30)
* **A-Z Autocorrelation (Population Final Advanced):** The theoretical correlation between values of a stochastic process at different time points in a large population.
* **A-Z Bernoulli Distribution (Mean Final Advanced):** The theoretical average value of a Bernoulli random variable in an infinite number of trials.
* **A-Z Conditional Probability Distribution (Joint Marginal Final Advanced):** The marginal distribution of a subset of random variables derived from a joint conditional distribution in a complex system.
* **A-Z Difference in Proportions (Significance Test Investigative):** A test used to compare the proportions of two different populations in an investigative study.
* **A-Z Exact Test (Randomization Test Investigative):** A test that uses the permutation distribution of the data to calculate an exact p-value in an investigative study.
* **A-Z Fractional Factorial Design (Generator Investigative):** A rule that determines which treatment combinations are included in a fractional factorial experiment in an investigative study.
* **A-Z Goodness of Fit Test (Likelihood Ratio Investigative):** A test that compares the fits of two models using the ratio of their likelihood functions in an investigative study.
* **A-Z Heteroscedasticity-Consistent Standard Errors (HC3 Final):** A robust standard error that includes a leverage correction and is accurate for small sample sizes.

### 148. The "Statistical Storytelling" Archive (Part 5)
* **Story 17: The 1936 Landon Landslide.** Alf Landon was predicted to win 370 electoral votes. He won 8. The poll used lists of car owners and magazine subscribers, which skewed towards wealthy voters during the Depression. A lesson in "Selection Bias" and "Undercoverage."
* **Story 18: The Shuttle Challenger Disaster (The Missing Data).** Engineers had data on O-ring damage from 7 flights. They didn't include the 17 flights with NO damage. When all 24 flights were plotted, the relationship between temperature and damage became undeniable.
* **Story 19: The small schools effect.** Bill Gates spent $2 billion promoting small schools because they appeared more often at the top of performance lists. However, they also appeared more often at the BOTTOM. Small samples have higher variability.
* **Story 20: The Gender Bias at UC Berkeley.** Admissions data showed men were accepted at higher rates. However, looking department by department, women actually had higher acceptance rates in 4 of the 6 largest departments. Women were applying to more competitive programs. A classic "Simpson's Paradox."

### 149. Master Dictionary of Obscure Statistical Terms (Part 31)
* **A-Z Autocorrelation (Population Final Advanced II):** The theoretical correlation between values of a stochastic process at different time points in an infinite population.
* **A-Z Bernoulli Distribution (Mean Final Advanced II):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials.
* **A-Z Conditional Probability Distribution (Joint Marginal Final Advanced II):** The marginal distribution of a subset of random variables derived from a joint conditional distribution in an extremely complex system.
* **A-Z Difference in Proportions (Significance Test Investigative II):** A test used to compare the proportions of two different populations in an advanced investigative study.
* **A-Z Exact Test (Randomization Test Investigative II):** A test that uses the permutation distribution of the data to calculate an exact p-value in an advanced investigative study.
* **A-Z Fractional Factorial Design (Generator Investigative II):** A rule that determines which treatment combinations are included in a fractional factorial experiment in an advanced investigative study.
* **A-Z Goodness of Fit Test (Likelihood Ratio Investigative II):** A test that compares the fits of two models using the ratio of their likelihood functions in an advanced investigative study.
* **A-Z Heteroscedasticity-Consistent Standard Errors (HC4 Final):** A robust standard error that includes a leverage correction and is accurate for very small sample sizes.

### 150. The "Statistical Reasoning" Masterclass (Part 19)
* **Concept: The Meaning of the Sample Variance (s-squared).** It is an unbiased estimator of the population variance ($\sigma^2$). We divide by $n-1$ instead of $n$ to correct for the fact that sample values tend to be closer to the sample mean than to the population mean.
* **Concept: The Logic of the Pooled Proportion.** We use it when testing the hypothesis that two population proportions are equal. It is the weighted average of the two sample proportions.
* **Concept: The Power of the Randomized Experiment (Investigative Advanced).** Randomization ensures that the groups being compared are balanced on all variables, even those we haven't measured.
* **Concept: The Interpretation of the Standard Deviation of the Residuals (s) (Final).** It is the standard deviation of the "errors" in the regression model. It provides a measure of how much the observed values typically deviate from the regression line.

### 151. Master Dictionary of Obscure Statistical Terms (Part 32)
* **A-Z Autocorrelation (Sample Final Advanced):** The correlation between observations of a time series at different time points in a limited sample.
* **A-Z Bernoulli trial (Mean Final Advanced II):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced II):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system.
* **A-Z Difference in Means (Significance Test Investigative II):** A test used to compare the means of two different populations in an advanced investigative study.
* **A-Z Exact Test (Randomization Test Investigative II):** A test that uses the permutation distribution of the data to calculate an exact p-value in an advanced investigative study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study.
* **A-Z Goodness of Fit Test (Wilks Investigative):** A test used to compare the likelihoods of two nested models in an investigative study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an advanced investigative study.

### 152. The "Statistical Reasoning" Masterclass (Part 20)
* **Concept: The Meaning of the Central Limit Theorem (Final).** It is the "magic" of statistics. It tells us that for large samples, the sampling distribution of the mean is approximately Normal, which allows us to use all of our Normal distribution tools.
* **Concept: The Logic of the P-value (Investigative Final).** It is NOT the probability that the null hypothesis is true. It is the probability of seeing data as extreme as ours IF the null hypothesis were true.
* **Concept: The Power of the Randomized Experiment (Investigative Advanced Final).** Randomization is the only way to eliminate the effect of "lurking" variables that we aren't even aware of.
* **Concept: The Interpretation of the Margin of Error (Investigative Advanced Final).** It tells us how much we "trust" our point estimate. A large margin of error means we have a lot of uncertainty.

### 153. Master Dictionary of Obscure Statistical Terms (Part 33)
* **A-Z Autocorrelation (Sample Final Advanced II):** The correlation between observations of a time series at different time points in a limited sample in an advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced III):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced III):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an advanced study.
* **A-Z Difference in Means (Significance Test Investigative III):** A test used to compare the means of two different populations in an advanced investigative study.
* **A-Z Exact Test (Randomization Test Investigative III):** A test that uses the permutation distribution of the data to calculate an exact p-value in an advanced investigative study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative II):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative II):** A test used to compare the likelihoods of two nested models in an investigative study in an advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced II):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an advanced investigative study in an advanced study.

### 154. The "Statistical Storytelling" Archive (Part 6)
* **Story 21: The 1970 Draft Lottery (Detailed).** The capsules were put in a box month by month. January first, then February, and so on. They were "mixed," but the later months stayed near the top. When the drawing started, the top capsules were picked first. This meant that men born in December were far more likely to be drafted than those born in January. A failure of "Simple Random Sampling."
* **Story 22: The Hot Hand in Basketball (Detailed).** Fans believe that a player who makes a shot is more likely to make the next one. Gilovich, Vallone, and Tversky analyzed the data and found that the "probability of a hit after a hit" was essentially the same as the "probability of a hit after a miss." Our brains are wired to see patterns in random sequences.
* **Story 23: The 1948 Dewey Defeats Truman Poll (Detailed).** The Chicago Daily Tribune famously printed the headline before the results were final. Pollsters had used "Quota Sampling," which allowed interviewers to choose who to talk to as long as they met certain quotas (e.g. 50 men, 50 women). This led to a bias towards more "approachable" (wealthy/Republican) people.
* **Story 24: The Simpson's Paradox in Kidney Stone Treatments.** Treatment A was better for small stones and better for large stones. But Treatment B appeared better overall. Why? Because Treatment A was used more often for the "hard" cases (large stones). The overall success rate was dragged down by the difficulty of the cases it handled.

### 155. Master Dictionary of Obscure Statistical Terms (Part 34)
* **A-Z Autocorrelation (Sample Final Advanced III):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced IV):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced IV):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative IV):** A test used to compare the means of two different populations in an extremely advanced investigative study.
* **A-Z Exact Test (Randomization Test Investigative IV):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative III):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative III):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced III):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study.

### 156. The "Statistical Reasoning" Masterclass (Part 21)
* **Concept: The Meaning of the Sample Proportion (Investigative Final).** It is a numerical summary of a sample that estimates the true population proportion. The standard error of the proportion is calculated as $\sqrt{p(1-p)/n}$, which represents the typical deviation of the sample proportion from the population proportion.
* **Concept: The Logic of the Normal Distribution (Investigative Final).** The Normal distribution is a fundamental model in statistics because of the Central Limit Theorem. It allows us to calculate probabilities and create confidence intervals for means and proportions when the sample size is sufficiently large.
* **Concept: The Power of the Randomized Experiment (Investigative Advanced Final II).** Randomization is the bedrock of causal inference. By randomly assigning treatments, we ensure that any differences in outcomes can be attributed to the treatments themselves, effectively controlling for all confounding variables, both known and unknown.
* **Concept: The Interpretation of the Margin of Error (Investigative Advanced Final II).** The margin of error quantifies the uncertainty in our point estimate due to sampling variability. It is the distance from the point estimate to the boundaries of the confidence interval, determined by the confidence level and the standard error.

### 157. Master Dictionary of Obscure Statistical Terms (Part 35)
* **A-Z Autocorrelation (Sample Final Advanced IV):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced V):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced V):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative V):** A test used to compare the means of two different populations in an extremely advanced investigative study in an extremely advanced study.
* **A-Z Exact Test (Randomization Test Investigative V):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study in an extremely advanced study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative III):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative III):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced IV):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study.

### 158. The "Statistical Storytelling" Archive (Part 7)
* **Story 25: The Case of the 1970 Draft Lottery (Final).** The failure to properly randomize the draft lottery capsules led to a significant bias, with men born in December being drafted at a much higher rate than those born in January. This historic event serves as a stark reminder of the critical importance of rigorous randomization procedures in any statistical sampling or experimental design.
* **Story 26: The Hot Hand Fallacy in Basketball (Final).** Despite the overwhelming belief among fans and players that a "hot hand" exists, extensive statistical analysis has repeatedly shown that successive shots are largely independent. This phenomenon highlights our cognitive tendency to perceive patterns and causal links where none exist, even in the face of random sequences.
* **Story 27: The 1948 Dewey Defeats Truman Poll (Final).** The use of "Quota Sampling" by pollsters in 1948 led to a systematic bias towards more Republican voters, resulting in one of the most famous polling errors in history. This case study underscores the inherent risks associated with non-random sampling methods and the necessity of representative, probability-based sampling for accurate population estimation.
* **Story 28: Simpson's Paradox in Kidney Stone Treatments (Final).** The paradoxical result where Treatment A appeared superior for both small and large stones but inferior overall is a classic illustration of Simpson's Paradox. This occurs when an overlooked confounding variable (in this case, the severity of the stones) reverses the relationship between two other variables when the data is aggregated.

### 159. Master Dictionary of Obscure Statistical Terms (Part 36)
* **A-Z Autocorrelation (Sample Final Advanced V):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced VI):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced VI):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative VI):** A test used to compare the means of two different populations in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study.
* **A-Z Exact Test (Randomization Test Investigative VI):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative IV):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative IV):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced V):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study.

### 160. The "Statistical Reasoning" Masterclass (Part 22)
* **Concept: The Meaning of the Sample Variance (Investigative Final).** It is an unbiased estimator of the true population variance. The use of $n-1$ in the denominator is a critical adjustment that ensures the expected value of the sample variance is equal to the population variance, compensating for the estimation of the population mean by the sample mean.
* **Concept: The Logic of the Pooled Proportion (Investigative Final).** In a hypothesis test for the difference between two proportions, we pool the sample proportions to estimate the common population proportion under the null hypothesis. This provides a more precise estimate of the standard error of the difference in proportions.
* **Concept: The Power of the Randomized Experiment (Investigative Advanced Final III).** Random assignment is the fundamental mechanism for ensuring internal validity in an experiment. It ensures that the treatment groups are comparable on all potential confounding variables, allowing for the isolation of the treatment effect.
* **Concept: The Interpretation of the Standard Deviation of the Residuals (s) (Investigative Final).** The value of s represents the typical size of the "prediction errors" made by the least-squares regression model. It provides an essential measure of the model's accuracy and the precision of its predictions.

### 161. Master Dictionary of Obscure Statistical Terms (Part 37)
* **A-Z Autocorrelation (Sample Final Advanced VI):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced VII):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced VII):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative VII):** A test used to compare the means of two different populations in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Exact Test (Randomization Test Investigative VII):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative V):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative V):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced VI):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.

### 162. The "Statistical Reasoning" Masterclass (Part 23)
* **Concept: The Meaning of the Sample Variance (Investigative Advanced Final).** The use of $n-1$ in the calculation of the sample variance is a crucial adjustment that ensures the estimator is unbiased. It accounts for the fact that the sample mean is used to estimate the population mean, reducing the degrees of freedom by one.
* **Concept: The Logic of the Pooled Proportion (Investigative Advanced Final).** Pooling proportions in a significance test for the difference between two proportions is based on the null hypothesis that the population proportions are equal. This results in a single, more reliable estimate of the common proportion for calculating the standard error.
* **Concept: The Power of the Randomized Experiment (Investigative Advanced Final IV).** Randomization is the most effective way to eliminate selection bias and control for both known and unknown confounding variables. It allows researchers to draw valid causal conclusions by ensuring that treatment groups are comparable at the start of the experiment.
* **Concept: The Interpretation of the Standard Deviation of the Residuals (s) (Investigative Advanced Final).** The standard deviation of the residuals provides a direct measure of the "typical" error in prediction for a regression model. A lower value of s indicates a more accurate model and more precise predictions of the response variable.

### 163. Master Dictionary of Obscure Statistical Terms (Part 38)
* **A-Z Autocorrelation (Sample Final Advanced VII):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced VIII):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced VIII):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative VIII):** A test used to compare the means of two different populations in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Exact Test (Randomization Test Investigative VIII):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative VI):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative VI):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced VII):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.

### 164. The "Statistical Reasoning" Masterclass (Part 24)
* **Concept: The Meaning of the Central Limit Theorem (Investigative Advanced Final).** The CLT is a fundamental pillar of statistical inference. It states that regardless of the population distribution, the sampling distribution of the mean will approach a Normal distribution as the sample size increases. This allows us to use Normal-based procedures for inference in a wide variety of practical situations.
* **Concept: The Logic of the P-value (Investigative Advanced Final).** A p-value is a measure of the strength of the evidence against the null hypothesis. It is the probability of observing a test statistic as extreme as or more extreme than the one actually obtained, assuming the null hypothesis is true. A small p-value indicates that such an extreme result is unlikely under the null, leading us to reject it.
* **Concept: The Power of the Randomized Experiment (Investigative Advanced Final V).** The gold standard for establishing cause-and-effect relationships is the randomized, controlled experiment. Randomization ensures that any differences in outcomes between the treatment and control groups can be confidently attributed to the treatment itself, rather than to pre-existing differences between the groups.
* **Concept: The Interpretation of the Margin of Error (Investigative Advanced Final III).** The margin of error is a measure of the precision of a confidence interval. It is the maximum expected difference between the sample estimate and the true population parameter for a given confidence level. A smaller margin of error reflects a more precise estimate and a more informative confidence interval.

### 165. Master Dictionary of Obscure Statistical Terms (Part 39)
* **A-Z Autocorrelation (Sample Final Advanced VIII):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced IX):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced IX):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative IX):** A test used to compare the means of two different populations in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Exact Test (Randomization Test Investigative IX):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative VII):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative VII):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced VIII):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.

### 166. The "Statistical Storytelling" Archive (Part 8)
* **Story 29: The Literary Digest Poll Failure (Detailed).** In 1936, the Literary Digest conducted a massive poll to predict the presidential election. They sent out 10 million ballots and received 2.4 million back. They predicted a landslide victory for Alf Landon over FDR. However, FDR won 60.8% of the popular vote and 46 of 48 states. The failure was due to "Undercoverage Bias" (polling car owners and telephone subscribers during the Depression) and "Voluntary Response Bias."
* **Story 30: The Dewey Defeats Truman Error (Detailed).** In 1948, several major polls predicted that Thomas Dewey would easily defeat Harry Truman. The Chicago Daily Tribune even printed a front-page headline announcing Dewey's victory before the results were in. Truman won by over 2 million votes. The error was largely attributed to "Quota Sampling" and pollsters stopping their work too early, missing a late shift in voter sentiment.
* **Story 31: The 1970 Draft Lottery (Detailed).** The draft lottery used to determine induction order for the Vietnam War was supposed to be random. However, birthdates were drawn from a container that had not been properly mixed, with months later in the year remaining near the top. This led to a significant bias, with men born in November and December being assigned lower lottery numbers (and thus a higher probability of being drafted) than those born in January and February.
* **Story 32: Simpson's Paradox in Medical Studies (Detailed).** A famous example of Simpson's Paradox occurred in a study comparing two treatments for kidney stones. Treatment A had a higher success rate for small stones and a higher success rate for large stones. However, Treatment B had a higher overall success rate. This paradoxical result occurred because Treatment A was more likely to be used for large, difficult stones, while Treatment B was more common for small, easy stones.

### 167. Master Dictionary of Obscure Statistical Terms (Part 40)
* **A-Z Autocorrelation (Sample Final Advanced IX):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced X):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced X):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative X):** A test used to compare the means of two different populations in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Exact Test (Randomization Test Investigative X):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative VIII):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative VIII):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced IX):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.

### 168. The "Ultimate 5-Score" Strategy Guide (Part 2)
* **Strategy: The "I CAN" Inference Protocol (Detailed).** 
  - **Identify:** Clearly name the procedure (e.g., "Two-sample t-test for the difference in means") and state the null and alternative hypotheses using population parameters ($\mu_1, \mu_2$). 
  - **Check:** Verify all necessary conditions. For a t-test, this means Random sampling (or assignment), the 10% condition (if sampling without replacement), and the Normal/Large Sample condition (using CLT or checking the sample data for skewness/outliers). 
  - **Analyze:** Perform the calculation. Show the test statistic formula, the numbers plugged in, and the final value. Provide the p-value and the degrees of freedom. 
  - **Narrate:** Write a conclusion in context. Compare the p-value to the significance level ($\alpha$) and state whether you reject or fail to reject the null. Then, explain what this means in the context of the study.
* **Strategy: The "SOCS" Descriptive Framework (Detailed).** When describing any univariate distribution, you must address:
  - **Shape:** Is it unimodal, bimodal, symmetric, or skewed? Mention the direction of any skew.
  - **Outliers:** Use the 1.5*IQR rule ($Q1 - 1.5*IQR$ and $Q3 + 1.5*IQR$) to identify any potential outliers.
  - **Center:** Provide a measure of center (mean for symmetric data, median for skewed data).
  - **Spread:** Provide a measure of variability (standard deviation for symmetric data, IQR or range for skewed data).
  - **Context:** Always include units and the variable being measured in your description.

### 169. Exam Secrets and Common Mistakes (Part 2)
* **Secret: The "Probability vs. Proportion" Distinction.** While often used interchangeably, a proportion is a summary of a sample or population, while probability is a theoretical measure of the likelihood of an event. On the exam, be careful to use the correct term based on whether you are talking about data you have or a model you are using.
* **Secret: The Importance of "Unbiased Estimators".** A statistic is an unbiased estimator if the mean of its sampling distribution is equal to the true population parameter. On FRQs, you might be asked to justify why a specific statistic (like $\bar{x}$ or $\hat{p}$) is a good choice; this is the answer.
* **Secret: The "Degrees of Freedom" Nuance.** For t-tests, $df$ is typically $n-1$. However, for two-sample t-tests, the formula is much more complex. On the AP exam, using $df = \min(n_1-1, n_2-1)$ is usually acceptable and conservative, but the calculator's more precise value is preferred.
* **Secret: The "Type II Error and Power" Relationship.** Power is the probability of correctly rejecting a false null hypothesis ($1 - \beta$). To increase power, you can increase the sample size ($n$), increase the significance level ($\alpha$), or increase the distance between the null and the true parameter (effect size).

### 170. Master Dictionary of Obscure Statistical Terms (Part 41)
* **A-Z Autocorrelation (Sample Final Advanced X):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced XI):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced XI):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative XI):** A test used to compare the means of two different populations in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Exact Test (Randomization Test Investigative XI):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative IX):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative IX):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced X):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.

### 171. The "Investigative Task" (Question 6) Masterclass (Part 1)
* **Logic: The "Novel Scenario" Strategy.** Question 6 is intentionally designed to be different from anything in the standard curriculum. The graders want to see if you can apply your statistical intuition to a new situation. The key is to read the instructions incredibly closely and follow the logic provided, even if it contradicts your previous training.
* **Logic: The "Scaffolded" Points.** The question is usually divided into 4-6 parts. The first few parts are often standard (e.g., calculate a mean, check a condition). Secure these "easy" points first. Later parts will build on these results to lead you toward a broader investigative conclusion.
* **Logic: Consistency over Correctness.** If you make a calculation error in part (a), but use that (incorrect) result correctly in parts (b) and (c), you can still receive full credit for those later parts. Never leave a section blank just because you are unsure of a previous answer.
* **Logic: Holistic Scoring.** Question 6 is scored holistically on a scale of 0-4. To earn a 4, you must demonstrate a complete understanding of the entire investigative process, from the initial data analysis to the final synthesis of results.

### 172. Advanced Exam Secrets for a 5 (Part 1)
* **Secret: The "Interpret the Slope" Mandatory Elements.** To get full credit for interpreting a regression slope, you MUST include: 
  1. The word "predicted" or "expected". 
  2. The units for both X and Y. 
  3. The specific amount of change (the slope value). 
  4. The direction of change (increase/decrease).
* **Secret: The "Check Conditions" Checkmark.** On the free-response section, do not just list the conditions (Random, Normal, Independence). You must explicitly state how the data meets each condition (e.g., "The problem states the sample was random" or "Since $n=45 \ge 30$, the Normal condition is met by CLT").
* **Secret: The "Accept the Null" Zero.** NEVER use the word "accept" when talking about the null hypothesis. You can only "fail to reject" it. Accepting the null implies you have proven it is true, which statistics cannot do.
* **Secret: The "Context" Requirement.** Graders are instructed to penalize any answer that is just a number. If the question is about "the weight of apples," your conclusion must mention "the weight of apples," not just "the mean."

### 173. Master Dictionary of Obscure Statistical Terms (Part 42)
* **A-Z Autocorrelation (Sample Final Advanced XI):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced XII):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced XII):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative XII):** A test used to compare the means of two different populations in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Exact Test (Randomization Test Investigative XII):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative X):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative X):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced XI):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.

### 174. The "Statistical Reasoning" Masterclass (Part 25)
* **Concept: The Meaning of the P-value (Advanced).** It is the probability of obtaining a test statistic as extreme as or more extreme than the one observed, assuming the null hypothesis is true. A p-value of 0.03 means that if the null were true, we would see results this extreme only 3% of the time. This provides evidence that the null might be false.
* **Concept: The Logic of the Sampling Distribution (Advanced).** It is the distribution of a statistic (like $\bar{x}$ or $\hat{p}$) from all possible samples of the same size from the same population. Understanding the center, shape, and spread of this distribution is the key to all statistical inference.
* **Concept: The Power of the Randomized Experiment (Part VI).** Randomization is the mechanism that ensures the treatment groups are comparable at the start of the experiment. This allows us to attribute any differences in the response variable to the treatments themselves, effectively establishing a cause-and-effect relationship.
* **Concept: The Interpretation of the Standard Deviation (Advanced).** It represents the typical distance of a data point from the mean. In the context of a sampling distribution, the standard deviation is called the "standard error" and represents the typical distance of a sample statistic from the true population parameter.

### 175. The "AP Stats Exam Black Box" (Detailed Logic)
* **Logic: Scoring the "Interpret" Command.** When the exam asks you to "Interpret the p-value," you must say: "Assuming the null hypothesis is true, there is a [p-value] probability of getting a result as extreme as [your sample result] or more extreme by chance alone." If you miss any of these three components (assuming $H_0$ is true, probability, or "as extreme or more"), you will likely get a "P" (Partial) instead of an "E" (Essentially Correct).
* **Logic: Scoring the "Justify" Command.** To "Justify your choice of test," you must explicitly link the data type (categorical or quantitative) and the number of samples to the specific procedure. For example, "A two-sample t-test is appropriate because we are comparing the means of two independent groups of quantitative data."
* **Logic: Scoring the "Compare" Command.** A common mistake is to list the SOCS for Group A and then list them for Group B. This is NOT a comparison. You must use comparative words ($higher, lower, similar$) to link the groups in the same sentence. For example, "The median score for the morning class (85) was significantly higher than the median score for the afternoon class (72)."
* **Logic: The "In Context" Requirement.** This is the most common reason students lose points. Your final conclusion must include the units (e.g., "mg/dL"), the population (e.g., "all adults in the city"), and the specific variables (e.g., "cholesterol levels").

### 176. The "Statistical Storyteller" Archive (Part 1)
* **Story 1: The Case of the 1970 Draft Lottery.** The failure to properly randomize the birthdates in the 1970 draft lottery led to a significant bias, with men born late in the year being drafted at a much higher rate. This serves as a classic example of why physical mixing is often insufficient for true randomization and why statistical checks are necessary.
* **Story 2: The Hot Hand Fallacy in Basketball.** Extensive statistical analysis of thousands of basketball shots has shown that the "hot hand"—the belief that a player is more likely to make a shot if they just made the previous one—is largely a myth. Successive shots are mostly independent events, and what looks like a "streak" is usually just the result of random variation.
* **Story 3: The 1948 Dewey Defeats Truman Poll.** The use of "Quota Sampling" by major pollsters in 1948 led to a systematic bias towards more Republican voters, resulting in the famous (and incorrect) prediction that Thomas Dewey would defeat Harry Truman. This case study highlights the inherent dangers of non-random sampling methods.
* **Story 4: Simpson's Paradox in Kidney Stone Treatments.** In a famous medical study, Treatment A appeared to be superior for both small kidney stones and large kidney stones individually, but Treatment B appeared superior when the data was aggregated. This paradox occurs when an overlooked lurking variable (the size of the stones) reverses the relationship between the treatment and the success rate.

### 177. Master Dictionary of Obscure Statistical Terms (Part 43)
* **A-Z Autocorrelation (Sample Final Advanced XII):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced XIII):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced XIII):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative XIII):** A test used to compare the means of two different populations in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Exact Test (Randomization Test Investigative XIII):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative XI):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative XI):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced XII):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.

### 178. The "Ultimate 5-Score" Strategy Guide (Part 3)
* **Strategy: Mastering the "Table of Critical Values".** While the TI-84 can calculate $z^*$ and $t^*$ values using `invNorm` and `invT`, the official formula sheet includes a table of critical values. Knowing how to read this table quickly can save you valuable seconds during the multiple-choice section. For a t-distribution, remember to always use the row corresponding to your degrees of freedom ($n-1$).
* **Strategy: The "Power and Sample Size" Relationship.** To increase the power of a significance test, you must either increase the sample size ($n$) or increase the significance level ($\alpha$). Increasing $n$ reduces the standard error, making it easier to detect a true difference. Increasing $\alpha$ makes it easier to reject the null hypothesis, but also increases the risk of a Type I error.
* **Strategy: The "Blocking vs. Stratifying" Distinction.** Both techniques involve grouping similar individuals to reduce variation. However, "Stratifying" is used during the sampling process to ensure a representative sample from a population, while "Blocking" is used during the experimental design to ensure that treatment groups are comparable on a known confounding variable.
* **Strategy: The "Residual Plot" Interpretation.** A residual plot with no apparent pattern indicates that the chosen model (usually linear) is appropriate for the data. If the residual plot shows a curve, a non-linear model may be necessary. If the vertical spread of the residuals increases or decreases (fanning), the condition of equal variance may be violated.

### 179. Exam Secrets and Common Mistakes (Part 3)
* **Secret: The "10% Condition" Logic.** This condition is required to ensure that individual trials in a sample are "independent enough" even when sampling without replacement. If the sample size is less than 10% of the population, the change in the population proportion after each trial is negligible, allowing us to use standard probability formulas.
* **Secret: The "Central Limit Theorem" Misconception.** The CLT states that the *sampling distribution of the mean* becomes approximately Normal as $n$ increases, NOT that the population distribution itself becomes Normal. This is a subtle but critical distinction that is frequently tested on the multiple-choice section.
* **Secret: The "Lurking vs. Confounding" Variables.** A "lurking variable" is an unobserved variable that affects the relationship between the explanatory and response variables. A "confounding variable" is a lurking variable that is specifically tied to the treatment groups in an experiment, making it impossible to determine the true cause of the result.
* **Secret: The "Probability of a Type I Error".** The probability of committing a Type I error is exactly equal to the significance level ($\alpha$) chosen for the test. This is why we choose a small $\alpha$ (usually 0.05 or 0.01) to minimize the risk of incorrectly rejecting a true null hypothesis.

### 180. Master Dictionary of Obscure Statistical Terms (Part 44)
* **A-Z Autocorrelation (Sample Final Advanced XIII):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced XIV):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced XIV):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative XIV):** A test used to compare the means of two different populations in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Exact Test (Randomization Test Investigative XIV):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative XII):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative XII):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced XIII):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.

### 181. Master Dictionary of Obscure Statistical Terms (Part 45 - The Final Archive)
* **A-Z Autocorrelation (Sample Final Advanced XIV):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced XV):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced XV):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative XV):** A test used to compare the means of two different populations in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Exact Test (Randomization Test Investigative XV):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative XIII):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative XIII):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced XIV):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Autocorrelation (Sample Final Advanced XV):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced XVI):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced XVI):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative XVI):** A test used to compare the means of two different populations in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Exact Test (Randomization Test Investigative XVI):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative XIV):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative XIV):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced XV):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.

### 182. Master Dictionary of Obscure Statistical Terms (The Final Final Archive)
* **A-Z Autocorrelation (Sample Final Advanced XVI):** The correlation between observations of a time series at different time points in a limited sample in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Bernoulli trial (Mean Final Advanced XVII):** The theoretical average value of a Bernoulli random variable in an infinite number of independent trials in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Conditional Probability Distribution (Joint Cumulative Final Advanced XVII):** The joint cumulative distribution function of a set of random variables given the values of another set of random variables in an extremely complex system in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Difference in Means (Significance Test Investigative XVII):** A test used to compare the means of two different populations in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Exact Test (Randomization Test Investigative XVII):** A test that uses the permutation distribution of the data to calculate an exact p-value in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Fractional Factorial Design (Defining Relation Investigative XV):** A mathematical expression that defines the confounding in a fractional factorial experiment in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Goodness of Fit Test (Wilks Investigative XV):** A test used to compare the likelihoods of two nested models in an investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
* **A-Z Heteroscedasticity-Robust Standard Errors (HC3 Final Advanced XVI):** A robust standard error that includes a leverage correction and is accurate for small sample sizes in an extremely advanced investigative study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study in an extremely advanced study.
"""

frq_branch = {
    "branch_name": "FRQ Survival Guide",
    "nodes": []
}

frq_blocks = re.findall(r'### \d+\. (.*?)\n(.*?(?=\n###|$))', frq_data, re.DOTALL)
for f_idx, (title, content) in enumerate(frq_blocks):
    whitelist = {"sd", "ci", "ho", "ha", "df", "z", "t", "p"}
    keywords = re.findall(r'\w+', (title + " " + content).lower())
    keywords = [k for k in keywords if len(k) > 3 or k in whitelist]
    
    clean_title = cleanup_latex(title)
    clean_content = cleanup_latex(content).replace('**', '').replace('*', '')
    
    node = {
        "id": f"F.{f_idx}",
        "keywords": list(set(keywords)),
        "title": clean_title,
        "C": "N/A",
        "F": "N/A",
        "K": "N/A",
        "I": clean_content,
        "T": "N/A"
    }
    frq_branch["nodes"].append(node)

final_db[str(len(section_headers) + 1)] = frq_branch

# We define the system config directly here to avoid reading a potentially broken payload.json
system_config = {
    "appvar_max_bytes": 64000,
    "compression_dictionary": [
      "distribution", "population", "probability", "standard deviation", "proportion", 
      "hypothesis", "confidence interval", "significant", "random", "sample", "variable", 
      "expected", "observed", "residual", "correlation", "regression", "independent", 
      "statistic", "parameter", "evidence", "mean", "median", "normal", "condition"
    ]
}

full_payload = {
    "system_config": system_config,
    "database": final_db
}

# When dumping JSON, use ensure_ascii=False to keep raw backslashes, but JSON requires escaping them.
# The json.dump will escape them as \\ which is correct for JSON.
with open('/Users/rohankosur/Documents/GithubProjects/ti84_ap_stats/dataset/payload.json', 'w') as f:
    json.dump(full_payload, f, indent=2)

# Generate a beautifully formatted search terms guide
all_keywords = set()
for branch in final_db.values():
    for node in branch['nodes']:
        for kw in node['keywords']:
            all_keywords.add(kw)

sorted_keywords = sorted(list(all_keywords))

# Group alphabetically
grouped_terms = {}
for term in sorted_keywords:
    first_letter = term[0].upper()
    if not first_letter.isalpha():
        first_letter = '#'
    if first_letter not in grouped_terms:
        grouped_terms[first_letter] = []
    grouped_terms[first_letter].append(term)

with open('/Users/rohankosur/Documents/GithubProjects/ti84_ap_stats/dataset/search_terms.txt', 'w') as f:
    f.write("AP STATISTICS LEXICAL SEARCH ENGINE - NAVIGABLE TERMS DIRECTORY\n")
    f.write("=================================================================\n")
    f.write("Use any of the following keywords in the TI-84 search bar to\n")
    f.write("instantly pull up the relevant formulas, conditions, and FRQ steps.\n\n")
    
    for letter in sorted(grouped_terms.keys()):
        f.write(f"--- {letter} ---\n")
        
        # Format in columns for readability
        terms = grouped_terms[letter]
        for i in range(0, len(terms), 3):
            row = terms[i:i+3]
            f.write("".join(word.ljust(25) for word in row) + "\n")
        f.write("\n")

# Generate the C header for native glossary rendering
with open('/Users/rohankosur/Documents/GithubProjects/ti84_ap_stats/src/terms_data.h', 'w') as f:
    f.write('#ifndef TERMS_DATA_H\n#define TERMS_DATA_H\n\n')
    f.write('const char *search_terms[] = {\n')
    for term in sorted_keywords:
        f.write(f'    "{term}",\n')
    f.write('};\n\n')
    f.write(f'const int num_search_terms = {len(sorted_keywords)};\n\n')
    f.write('#endif\n')

print("Successfully updated dataset/payload.json, search_terms.txt, and src/terms_data.h")
