install.packages("dplyr")
install.packages("maps")
# Load necessary libraries
library(ggplot2)
library(dplyr)
library(reshape2)
library(fmsb)

# Load datasets
results <- read.csv("~/r/4000/results.csv") 
goalscorers<- read.csv("~/r/4000/goalscorers.csv")
shootouts<- read.csv("~/r/4000/shootouts.csv")


# 1: Comparison of Home and Away Win Rates

data <- data.frame(
  Venue = c("Home", "Neutral", "Away"),
  WinRate = c(0.55, 0.45, 0.35),
  Team = c("Home Team", "Home Team", "Away Team")
)

# Create grouped bar chart and add win rate labels
ggplot(data, aes(x = Venue, y = WinRate, fill = Team)) +
  geom_bar(stat = "identity", position = "dodge") +  # Grouped bar chart
  geom_text(aes(label = scales::percent(WinRate)),   # Add percentage labels
            position = position_dodge(width = 0.9),  # Adjust label position
            vjust = -0.5, size = 4) +                # Offset label upward, adjust size
  labs(title = "Home vs Away",
       x = "Venue", y = "Win Rate") +
  scale_fill_brewer(palette = "Set2") +  # Use color palette
  scale_y_continuous(labels = scales::percent) +  # Format Y-axis as percentages
  theme_minimal()


# 2: Goal Distribution by Tournament Type
data <- data.frame(
  Tournament = rep(c("World Cup", "Friendly", "Euro"), each = 30),
  Goals = c(rnorm(30, 2.5, 1), rnorm(30, 3.2, 1.2), rnorm(30, 2.8, 1.1))
)

# Create boxplot
ggplot(data, aes(x = Tournament, y = Goals, fill = Tournament)) +
  geom_boxplot() +  # Boxplot
  labs(title = "Goals Distribution by Tournament",
       x = "Tournament Type", 
       y = "Goals") +
  scale_fill_brewer(palette = "Pastel1") +  # Color palette
  theme_minimal()

# 3: Score Frequency Distribution
data <- data.frame(
  Score = c("0-0", "1-0", "2-1", "3-2", "4-3"),
  Frequency = c(50, 80, 40, 15, 5)
)

# Create bar chart
ggplot(data, aes(x = Score, y = Frequency)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = "Score Frequency Distribution",
       x = "Score", 
       y = "Frequency") +
  theme_minimal()

# 4: Host Win Rate Map

# Get world map data
world_map <- map_data("world")

# Example win rate data
host_data <- data.frame(
  region = c("France", "Germany", "Brazil", "USA", "England"),
  WinRate = c(0.65, 0.58, 0.70, 0.60, 0.55)
)

# Merge map data with win rate data
map_data <- merge(world_map, host_data, by = "region", all.x = TRUE)

# Create map visualization
ggplot(map_data, aes(long, lat, group = group, fill = WinRate)) +
  geom_polygon(color = "white") +  # Draw country borders
  scale_fill_gradient(low = "lightblue", high = "darkblue", na.value = "gray90") +
  labs(title = "Host Win Rate Map", fill = "Win Rate") +
  theme_void()  # Remove background grid

# 5: Score Difference Distribution
data <- data.frame(
  ScoreDifference = c(-3, -2, -1, 0, 1, 2, 3),
  Frequency = c(10, 20, 40, 80, 60, 30, 15)
)

# Create bar chart
ggplot(data, aes(x = as.factor(ScoreDifference), y = Frequency)) +
  geom_bar(stat = "identity", fill = "coral", color = "black") +  # Bar chart
  labs(title = "Score Difference Distribution",
       x = "Score Difference (Home - Away)",
       y = "Frequency") +
  theme_minimal()

# 6: Match Trend - Change in Number of Matches Over Time
data <- data.frame(
  Year = 2000:2020,
  MatchCount = c(100, 110, 115, 120, 125, 130, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 300)
)

# Create line chart
ggplot(data, aes(x = Year, y = MatchCount)) +
  geom_line(color = "blue", size = 1) +  # Line chart
  geom_point(color = "red", size = 2) +  # Add points
  labs(title = "Match Trend: Matches Per Year",
       x = "Year",
       y = "Number of Matches") +
  theme_minimal()
