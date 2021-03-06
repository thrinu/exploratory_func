context("test url tools wrappers")

test_that("domain", {
  url <- c(
    "https://twitter.com/reddit?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor",
    NA
  )
  ret <- url_domain(url)
  expect_equal(ret, c("twitter.com", NA))
})


test_that("fragment", {
  url <- c(
    "https://twitter.com/reddit?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor",
    "https://en.wikipedia.org/wiki/Aaron_Halfaker?debug=true#test",
    NA
  )
  ret <- url_fragment(url)
  expect_equal(ret, c(NA, "test", NA))
})

test_that("parameters", {
  url <- c(
    "https://twitter.com/reddit?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor",
    "https://en.wikipedia.org/wiki/Aaron_Halfaker?debug=true#test",
    NA
  )
  ret <- url_parameters(url)
  expect_equal(ret, c("ref_src=twsrc^google|twcamp^serp|twgr^author", "debug=true", NA))
})

test_that("path", {
  url <- c(
    "https://twitter.com/reddit?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor",
    "https://twitter.com/reddit?ref_src=test",
    "http://www.computerhope.com/jargon/num/domains.htm"
  )
  ret <- url_path(url)
  expect_equal(ret, c("reddit", "reddit", "jargon/num/domains.htm"))
})

test_that("port", {
  url <- c(
    "https://twitter.com:222/reddit",
    "https://twitter.com:33/reddit?ref_src=test",
    "http://www.computerhope.com/jargon/num/domains.htm"
  )
  ret <- url_port(url)
  expect_equal(ret, c("222", "33", NA))
})

test_that("scheme", {
  url <- c(
    "https://twitter.com:222/reddit",
    "not url",
    "http://www.computerhope.com/jargon/num/domains.htm"
  )
  ret <- url_scheme(url)
  expect_equal(ret, c("https", NA, "http"))
})

test_that("suffix", {
  url <- c(
    "https://twitter.com/reddit?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor",
    "http://www.computerhope.com/jargon/num/domains.htm",
    "http://sample.edu.co"
    )
  ret <- url_suffix(url)
  expect_equal(ret, c("com", "com", "edu.co"))
})

test_that("subdomain", {
  url <- c(
    "https://twitter.com/reddit?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor",
    "http://www.computerhope.com/jargon/num/domains.htm"
  )
  ret <- url_subdomain(url)
  expect_equal(ret, c(NA, "www"))
})

test_that("top level domain", {
  url <- c(
    "https://twitter.com:222/reddit",
    "http://sample.edu.co",
    "not url"
  )
  ret <- url_tld(url)
  expect_equal(ret, c("com", "co", NA))
})

test_that("param", {
  url <- c(
    "https://twitter.com/reddit?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor",
    "https://twitter.com/reddit?ref_src=test",
    "http://www.computerhope.com/jargon/num/domains.htm"
  )
  ret <- url_param(url, "ref_src")
  expect_equal(ret, c("twsrc^google|twcamp^serp|twgr^author", "test", NA))
})
