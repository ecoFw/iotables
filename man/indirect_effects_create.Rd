% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/indirect_effects_create.R
\name{indirect_effects_create}
\alias{indirect_effects_create}
\title{Create indirect effects}
\usage{
indirect_effects_create(input_requirements, inverse, digits = NULL)
}
\arguments{
\item{input_requirements}{A matrix or vector created by 
\code{\link{input_indicator_create}}}

\item{inverse}{A Leontieff-inverse created by \code{\link{leontieff_inverse_create}}.}

\item{digits}{Rounding digits, defaults to \code{NULL}, in which case 
no rounding takes place.}
}
\description{
The function creates the effects.
}
\examples{
 
nl <- netherlands_2006

input_coeff_nl <- input_coefficient_matrix_create(
 data_table  = netherlands_2006, 
 households = FALSE) 

compensation_indicator <- input_indicator_create(netherlands_2006, 'compensation_employees')

I_nl <- leontieff_inverse_create( input_coeff_nl )

direct_effects_create(input_requirements = compensation_indicator, 
                           inverse = I_nl)
}
