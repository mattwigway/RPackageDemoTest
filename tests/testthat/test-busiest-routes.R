test_that("busiest_routes works", {
  data = readr::read_csv(system.file("testdata/passengers.csv", package="OdumDemo"))
  result = busiest_routes(data, from, to)
  expect_equal(result$airport1, c("JFK", "CLT"))
  expect_equal(result$airport2, c("SFO", "RDU"))
  expect_equal(result$Passengers, c(4, 3))
})