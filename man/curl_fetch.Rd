% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/fetch.R
\name{curl_fetch_memory}
\alias{curl_fetch_disk}
\alias{curl_fetch_memory}
\alias{curl_fetch_stream}
\title{Fetch the contents of a URL}
\usage{
curl_fetch_memory(url, handle = new_handle())

curl_fetch_disk(url, path, handle = new_handle())

curl_fetch_stream(url, fun, handle = new_handle())
}
\arguments{
\item{url}{A character string naming the URL of a resource to be downloaded.}

\item{handle}{a curl handle object}

\item{path}{Path to save results}

\item{fun}{Callback function. Should have one argument, which will be
a raw vector.}
}
\description{
Low-level bindings to write data from a URL into memory, disk or a callback
function. These are mainly intended for \code{httr}, most users will be better
off using the \code{\link{curl}} or \code{\link{curl_download}} function, or the
http specific wrappers in the \code{httr} package.
}
\details{
The curl_fetch functions automatically raise an error upon protocol problems
(network, disk, ssl) but do not implement application logic. For example for
you need to check the status code of http requests yourself in the response,
and deal with it accordingly.
}
\examples{
# Load in memory
res <- curl_fetch_memory("http://httpbin.org/cookies/set?foo=123&bar=ftw")
res$content

# Save to disk
res <- curl_fetch_disk("http://httpbin.org/stream/10", tempfile())
res$content
readLines(res$content)

# Stream with callback
res <- curl_fetch_stream("http://httpbin.org/stream/20", function(x){
  cat(rawToChar(x))
})
}

