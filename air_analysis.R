# Air travel analysis
# We have a 1% sample of all air legs flown in Q2 2022. We will use this to derive
# basic information about air flows in the US.

# This data is extracted from the Bureau of Transportation Statistics DB1B dataset

library(tidyverse)
devtools::load_all()

DATA_PATH = Sys.getenv("DATA_PATH")

# first, we need to load the data
data = load_air_data(file.path(DATA_PATH, "air_sample.csv"), file.path(DATA_PATH, "L_CITY_MARKET_ID.csv"), file.path(DATA_PATH, "L_CARRIERS.csv"))

busiest_routes(data, Origin, Dest)

# This may be misleading, however, as some metropolitan areas have only one airport
# (for example, Raleigh-Durham or Las Vegas), while others have more (for example,
# New York or Los Angeles). We can repeat the analysis grouping by "market", which
# groups these airports together.
# Now, we can see what the most popular air route is, by summing up the number of
# passengers carried.
busiest_routes(data, OriginCity, DestCity)
