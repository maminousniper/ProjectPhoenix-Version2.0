Auctions = {}
Auctions.RandomAuctionTime = 15 -- Every X minutes the system will create X amount of auctions (Auctions.RandomAuctionAmount).
Auctions.RandomAuctionAmount = {min = 1, max = 3} -- The system will pick a number between min and max to generate random contracts every X time (Auctions.RandomAuctionTime).
Auctions.Time = 30 -- Auctions will be live for X minutes, dealerships can place their bids during that time.
Auctions.DefaultDivider = 2.0 -- If the category is not registered in Auctions.CategoriesDivider it will use this value instead.
Auctions.CategoriesDivider = { -- When a new auction is created, the starting bid will be the basePrice divided by the category value (example: $100,000 / 2.0 = $50,000).
    ["compacts"] = 2.0,
    ["sedans"] = 2.0,
    ["suvs"] = 2.0,
    ["coupes"] = 2.0,
    ["muscle"] = 2.0,
    ["sportsclassic"] = 2.0,
    ["sports"] = 2.0,
    ["super"] = 2.0,
    ["motorcycle"] = 2.0,
    ["offroad"] = 2.0,
    ["industrial"] = 2.0,
    ["utility"] = 2.0,
    ["vans"] = 2.0,
    ["cycles"] = 2.0,
    ["boats"] = 2.0,
    ["helicopters"] = 2.0,
    ["planes"] = 2.0,
    ["service"] = 2.0,
    ["emergency"] = 2.0,
    ["military"] = 2.0,
    ["commercial"] = 2.0,
    ["trains"] = 2.0,
    ["openwheel"] = 2.0,
}