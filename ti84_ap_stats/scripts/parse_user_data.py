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
    "appvar_max_bytes": 200000,
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
