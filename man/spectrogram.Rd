% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spectrogram.R
\name{spectrogram}
\alias{spectrogram}
\title{Computes spectrogram}
\usage{
spectrogram(
  var,
  data,
  period_range = c(hours(16), hours(32)),
  resample_rate = 1/mins(15),
  FUN = cwt_spectrogram,
  ...
)
}
\arguments{
\item{var}{variable to analyse}

\item{data}{\link[behavr:behavr]{behavr::behavr} table}

\item{period_range}{vector of size 2 defining minimal and maximal range of period to study (in seconds)}

\item{resample_rate}{frequency to resample (up or down) the data at (in hertz)}

\item{FUN}{function used to compute spectrograms (so far, only CWT is implemented via \link{cwt_spectrogram})}

\item{...}{additional arguments to be passed to FUN}
}
\value{
A \link[behavr:behavr]{behavr::behavr} table.
In addition to the metadata, it contains data that encodes a spectrogram (i.e. power vs period).
The data contains the columns:
\itemize{
\item \code{t} -- the time (in s) (same range the input time)
\item \code{period} -- the period at which the \code{power} is computed, for a given \code{t} (in s)
\item \code{power} -- the power the or equivalent (according to \code{FUN})
\item \code{ridge} -- a logical defining whether the point (\code{t} and \code{period}) is a ridge
}
}
\description{
This function builds spectrogram, using CWT, for each individual of a \link[behavr:behavr]{behavr::behavr} table
}
\details{
A spectrogram is a estimation of the local periodicity of a signal at a given time.
In the context of circadian rhythm, it can be useful to understand how infradian rhythms change along the day or,
for instance, how circadian rhythm change ver the course of an multi-day experiment.
}
\examples{
data(dams_sample)
dt <- dams_sample[id \%in\% dams_sample[meta=TRUE, ,id[1:5]]]
spect_dt <- spectrogram(activity, dt)

\donttest{
require(ggetho)
ggspectro(spect_dt) +
        stat_tile_etho() +
        scale_y_log10() +
        facet_wrap(~ id)
}
}
\references{
\itemize{
\item \href{https://rethomics.github.io/ggetho.html#spectrograms}{spectrogram tutorial} -- the relevant rehtomics tutorial
}
}
\seealso{
\itemize{
\item \link{periodogram} -- to compute periodogram instead
\item \link{cwt_spectrogram} -- The dunction use to compute individual spectrograms
\item \link[ggetho:ggspectro]{ggetho::ggspectro} -- to plot spectrograms
}
}
