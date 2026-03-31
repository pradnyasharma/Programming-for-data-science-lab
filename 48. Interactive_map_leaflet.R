# 1) Install and Load Package
library(leaflet)

# Katpadi Coordinates
lat <- 12.9692
lng <- 79.1559

# 2) Initialize Map and Set View
map <- leaflet() %>%
  addTiles() %>%   # Base map tiles
  setView(lng = lng, lat = lat, zoom = 13)

# 3) Add Marker with Popup
map <- map %>%
  addMarkers(
    lng = lng,
    lat = lat,
    popup = "Katpadi, Vellore - Main Location"
  )

# 4) Add Customized Circle Marker
map <- map %>%
  addCircleMarkers(
    lng = lng + 0.01,
    lat = lat + 0.01,
    radius = 10,
    color = "red",
    label = "Nearby Area"
  )

# 5) Save and Open Map 

library(htmlwidgets)

saveWidget(map, "katpadi_map.html", selfcontained = TRUE)

browseURL("katpadi_map.html")
