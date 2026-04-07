
#' Compute carrier market shares by airport
#'
#' This function computes the market share of each carrier at each airport, with options for determining
#' how to determine the carrier and the airport (e.g. ticketed vs. operating, individual airport vs. metro
#' area airport system).
#'
#' The carrier and airport columns can be specified manually, so ticketing or operating
#' carrier can be used (or another carrier column, if you had one---for instance, mainline
#' vs regional carrier market share, or legacy vs. low-cost). The airport column is likewise
#' an argument, so market shares per-airport, per-city, per-state, etc. can be calculated.
#'
#' @param dataframe data to use
#' @param carriercol column of data frame that specifies carrier
#' @param origincol column of data frame that specifies airport
#' 
#' @examplesIf require("tibble")
#' data = tibble::tribble(
#'     ~Origin, ~Origin_City, ~Dest, ~Passengers, ~Carrier,
#'     "LAX",   "Los Angeles", "SFO", 400,        "DL",
#'     "LAX",   "Los Angeles", "IAD", 200,        "UA",
#'     "LGB",   "Los Angeles", "SJC", 100,        "B6"
#' )
#' 
#' # compute market shares for departures from each airport
#' market_shares(data, Carrier, Origin)
#' 
#' # compute market shares for departures combing all airports in Los Angeles area
#' market_shares(data, Carrier, Origin_City)
#'
#' @returns dataset containing market shares, with one row per by airline and airport
#'
#' @export
market_shares = function (dataframe, carrier, market) {
  mkt_shares = dataframe |>
    group_by({{ carrier }}, {{ market }}) |>
    summarize(Passengers = sum(Passengers)) |>
    group_by({{ market }}) |>
    mutate(market_share = Passengers / sum(Passengers), total_passengers = sum(Passengers)) |>
    ungroup() |>
    arrange(-market_share)
}