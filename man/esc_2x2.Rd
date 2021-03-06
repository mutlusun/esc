% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/esc_2x2.R
\name{esc_2x2}
\alias{esc_2x2}
\title{Compute effect size from 2 by 2 Contingency Table}
\usage{
esc_2x2(
  grp1yes,
  grp1no,
  grp2yes,
  grp2no,
  es.type = c("logit", "d", "g", "or", "r", "f", "eta", "cox.d"),
  study = NULL,
  ...
)
}
\arguments{
\item{grp1yes}{Size of treatment group with successes (outcome = yes).}

\item{grp1no}{Size of treatment group with non-successes (outcome = no).}

\item{grp2yes}{Size of control group with successes (outcome = yes).}

\item{grp2no}{Size of control group with non-successes (outcome = no).}

\item{es.type}{Type of effect size that should be returned.
\describe{
  \item{\code{"d"}}{returns standardized mean difference effect size \code{d}}
  \item{\code{"f"}}{returns effect size Cohen's \code{f}}
  \item{\code{"g"}}{returns adjusted standardized mean difference effect size Hedges' \code{g}}
  \item{\code{"or"}}{returns effect size as odds ratio}
  \item{\code{"cox.or"}}{returns effect size as Cox-odds ratio (see \code{\link{convert_d2or}} for details)}
  \item{\code{"logit"}}{returns effect size as log odds}
  \item{\code{"cox.log"}}{returns effect size as Cox-log odds (see \code{\link{convert_d2logit}} for details)}
  \item{\code{"r"}}{returns correlation effect size \code{r}}
  \item{\code{"eta"}}{returns effect size eta squared}
}}

\item{study}{Optional string with the study name. Using \code{\link{combine_esc}} or
\code{as.data.frame} on \code{esc}-objects will add this as column
in the returned data frame.}

\item{...}{Other parameters, passed down to further functions. For internal
use only, can be ignored.}
}
\value{
The effect size \code{es}, the standard error \code{se}, the variance
        of the effect size \code{var}, the lower and upper confidence limits
        \code{ci.lo} and \code{ci.hi}, the weight factor \code{w} and the
        total sample size \code{totaln}.
}
\description{
Compute effect size from a 2 by 2 frequency table.
}
\note{
If \code{es.type = "r"}, Fisher's transformation for the effect size
      \code{r} and their confidence intervals are also returned.
}
\examples{
# effect size log odds
esc_2x2(grp1yes = 30, grp1no = 50, grp2yes = 40, grp2no = 45)

# effect size odds ratio
esc_2x2(grp1yes = 30, grp1no = 50, grp2yes = 40, grp2no = 45, es.type = "or")

}
\references{
Lipsey MW, Wilson DB. 2001. Practical meta-analysis. Thousand Oaks, Calif: Sage Publications
            \cr \cr
            Wilson DB. 2016. Formulas Used by the "Practical Meta-Analysis Effect Size Calculator". Unpublished manuscript: George Mason University
}
