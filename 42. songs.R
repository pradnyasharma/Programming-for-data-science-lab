library(DBI)
library(RSQLite)
library(dplyr)
library(dbplyr)

# Connect to SQLite database
con <- dbConnect(RSQLite::SQLite(), "songs.db")

# Create table
dbExecute(con,"
CREATE TABLE IF NOT EXISTS songs (
song_id INTEGER PRIMARY KEY,
title TEXT,
artist_id INTEGER
)
")

# Insert sample data
dbExecute(con,"
INSERT INTO songs (title, artist_id) VALUES
('Bohemian Rhapsody',11),
('We Will Rock You',11),
('We Are The Champions',11),
('Another One Bites The Dust',11),
('Song A',5),
('Song B',6)
")

# Create table reference
songs_tbl <- tbl(con, "songs")

# Query songs by Queen
queen_songs <- songs_tbl %>%
  filter(artist_id == 11) %>%
  select(title)

# Show generated SQL
show_query(queen_songs)

# Retrieve data
result <- queen_songs %>% collect()

print(result)

# Disconnect
dbDisconnect(con)