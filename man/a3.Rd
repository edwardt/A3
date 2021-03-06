\name{a3}
\alias{a3}
\title{A3 Results for Arbitrary Model}
\usage{
  a3(formula, data, model.fn, model.args = list(), ...)
}
\arguments{
  \item{formula}{the regression formula.}

  \item{data}{a data frame containing the data to be used
  in the model fit.}

  \item{model.fn}{the function to be used to build the
  model.}

  \item{model.args}{a list of arguments passed to
  \code{model.fn}.}

  \item{...}{additional arguments passed to
  \code{\link{a3.base}}.}
}
\value{
  S3 \code{A3} object; see \code{\link{a3.base}} for
  details
}
\description{
  This function calculates the A3 results for an arbitrary
  model construction algorithm (e.g. Linear Regressions,
  Support Vector Machines or Random Forests). For linear
  regression models, you may use the \code{\link{a3.lm}}
  convenience function.
}
\examples{
\donttest{
 ## Standard linear regression results:

 summary(lm(rating ~ ., attitude))

 ## A3 Results for a Linear Regression model:

 # In practice, p.acc should be <= 0.01 in order
 # to obtain finer grained p values.

 a3(rating ~ ., attitude, lm, p.acc = 0.1)


 ## A3 Results for a Random Forest model:

 # It is important to include the "+0" in the formula
 # to eliminate the constant term.

 require(randomForest)
 a3(rating ~ .+0, attitude, randomForest, p.acc = 0.1)

 # Speed up the calculation by doing 5-fold cross-validation.
 # This is faster and more conservative (i.e. it should over-estimate error)

 a3(rating ~ .+0, attitude, randomForest, n.folds = 5, p.acc = 0.1)

 # Use Leave One Out Cross Validation. The least biased approach,
 # but, for large data sets, potentially very slow.

 a3(rating ~ .+0, attitude, randomForest, n.folds = 0, p.acc = 0.1)

 ## Use a Support Vector Machine algorithm.

 # Just calculate the slopes and R^2 values, do not calculate p values.

 require(e1071)
 a3(rating ~ .+0, attitude, svm, p.acc = NULL)
 }
}

