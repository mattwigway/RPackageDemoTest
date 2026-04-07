# Here, we want to look at what airports are most dominated by which airlines,
# using the same data. For simplicity, we only look at departing flights. Since
# most departing flights have a corresponding return flight, this should be fairly
# accurate.

library(tidyverse)
devtools::load_all()

DATA_PATH = Sys.getenv("DATA_PATH")

# first, we need to load the data
data = load_air_data(file.path(DATA_PATH, "air_sample.csv"), file.path(DATA_PATH, "L_CITY_MARKET_ID.csv"), file.path(DATA_PATH, "L_CARRIERS.csv"))

market_shares(data, OperatingCarrierName, OriginCity)

# many of the smaller airlines actually operate regional aircraft for larger carriers
# For instance, PSA Airlines flies small aircraft for American Airlines, branded as
# American Eagle and sold with connections to/from American Airlines flights.
# Here, we repeat the analysis using the TicketingCarrierName instead of the
# OperatingCarrierName.
market_shares(data, TicketingCarrierName, OriginCity)

# American is much more dominant in Charlotte than before, for example
