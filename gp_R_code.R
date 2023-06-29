library(mapboxapi)



library(leaflet)
library(readxl)

# Replace 'X525.xlsx' with the actual filename and path of your Excel file
slum_data <- read_excel("C:\\Users\\AnshulRaiSharma\\OneDrive - Azim Premji Foundation\\Documents\\525.xlsx")


# Create a Leaflet map
map <- leaflet() %>%
  addProviderTiles("OpenStreetMap.Mapnik") %>% # Use OpenStreetMap as the tile provider
  setView(lng = 77.5946, lat = 12.9716, zoom = 12) # Set the initial center and zoom level of the map

# Add markers to the map for each slum location
for (i in 1:nrow(slum_data)) {
  lat <- as.numeric(slum_data[i, 'village_latitude'])
  lng <- as.numeric(slum_data[i, 'village_longitude'])
  name <- slum_data[i, 'gp_name']
  
  map <- map %>%
    addMarkers(lng = lng, lat = lat, popup = name)
}

# Print the map
map


