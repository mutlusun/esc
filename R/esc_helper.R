# Compute variance of d-type effect size
esc.vd <- function(d, grp1n, grp2n) {
  (grp1n + grp2n) / (grp1n * grp2n) + (d * d) / (2 * (grp1n + grp2n))
}

# 95% confidence interval
#' @importFrom stats qnorm
lower_d <- function(d, v) d - stats::qnorm(.975) * sqrt(v)
upper_d <- function(d, v) d + stats::qnorm(.975) * sqrt(v)

# small sample size bias correction
sssbc <- function(totaln) return(1 - (3 / (4 * totaln - 9)))

# generic conversion function
esc_generic <- function(es, v, grp1n, grp2n, es.type, info, study) {
  # compute total n
  totaln <- grp1n + grp2n


  # return effect size as odds ratio

  if (es.type == "or")
    return(convert_d2or(
      d = es,
      v = v,
      totaln = totaln,
      es.type = "logit",
      info = paste0(info, " to effect size odds ratios"),
      study = study
    ))


  # return effect size as cox odds ratio

  if (es.type == "cox.or")
    return(convert_d2or(
      d = es,
      v = v,
      totaln = totaln,
      es.type = "cox",
      info = paste0(info, " to effect size Cox odds ratios"),
      study = study
    ))


  # return effect size as f

  if (es.type == "f")
    return(convert_d2f(
      d = es,
      v = v,
      totaln = totaln,
      info = paste0(info, " to effect size f"),
      study = study
    ))


  # return effect size as eta squared

  if (es.type == "eta")
    return(convert_d2etasq(
      d = es,
      v = v,
      grp1n = grp1n,
      grp2n = grp2n,
      info = paste0(info, " to effect size eta squared"),
      study = study
    ))


  # return effect size as log odds

  if (es.type == "logit")
    return(convert_d2logit(
      d = es,
      v = v,
      totaln = totaln,
      es.type = "logit",
      info = paste0(info, " to effect size logits"),
      study = study
    ))


  # return effect size as cox log odds

  if (es.type == "cox.log")
    return(convert_d2logit(
      d = es,
      v = v,
      totaln = totaln,
      es.type = "cox",
      info = paste0(info, " to effect size Cox logits"),
      study = study
    ))


  # return effect size as correlation

  if (es.type == "r")
    return(convert_d2r(
      d = es,
      v = v,
      grp1n = grp1n,
      grp2n = grp2n,
      info = paste0(info, " to effect size correlation"),
      study = study
    ))


  # return d or Hedges' g

  if (es.type == "d") {
    info.suffix <- " to effect size d"
  } else if (es.type == "g") {
    info.suffix <- " to effect size Hedges' g"
    es <- hedges_g(d = es, totaln = grp1n + grp2n)
  }


  # return effect size as standardized mean difference d or Hedges' g

  structure(
    class = c("esc", "esc_d"),
    list(es = es, se = sqrt(v), var = v, ci.lo = lower_d(es, v), ci.hi = upper_d(es, v),
         w = 1 / v, totaln = totaln, measure = es.type,
         info = paste0(info, info.suffix), study = study
  ))
}