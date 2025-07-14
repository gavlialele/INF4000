# International Football Insights Visualization (Project: INF4000)

## Overview

This project presents a series of data visualizations and statistical summaries aimed at uncovering key patterns in international football matches. The analysis highlights win rates, goal distributions, score patterns, geographic comparisons, and historical match trends using a combination of R and `ggplot2`.

---

## Dataset

**Dataset Files:**

- `results.csv`: Match-level data with scores, teams, and venues.
- `goalscorers.csv`: Information on individual goal scorers.
- `shootouts.csv`: Records of matches decided via penalty shootouts.

> 📁 All files are stored in the project root and read directly by the R script.

---

## Visualization Modules

### 1. Home vs Away Win Rates

- Comparison of win percentages across home, neutral, and away venues.
- Grouped bar chart with percentage labels to highlight venue impact.

### 2. Goal Distribution by Tournament Type

- Simulated goal distribution data for major tournaments: World Cup, Euro, and Friendly.
- Boxplots used to compare scoring variability.

### 3. Score Frequency Distribution

- Visualization of most frequent final scores using bar chart.

### 4. Host Nation Win Rate Map

- Choropleth map of selected countries showing win rate as hosts.
- Mapped using `maps` and `ggplot2`'s polygon support.

### 5. Score Difference Distribution

- Distribution of match score differences (Home - Away).
- Bar chart representing match competitiveness.

### 6. Historical Match Trends

- Line plot showing number of matches played per year from 2000 to 2020.
- Combined line and point chart for visual clarity.

---

## How to Run

### 1. Environment Requirements

- R version 4.0+
- Required packages:
  - `ggplot2`
  - `dplyr`
  - `reshape2`
  - `fmsb`
  - `maps`
  - `scales` (for formatted labels)

Install packages if needed:

```r
install.packages(c("ggplot2", "dplyr", "reshape2", "fmsb", "maps", "scales"))
```

### 2. File Structure

```
project_root/
├── INF4000.R                # Main R script for visualizations
├── goalscorers.csv          # Goal scorer data
├── results.csv              # Match results
├── shootouts.csv            # Shootout outcomes
```

### 3. Run the Script

In R:

```r
source("INF4000.R")
```

The script will produce several visualizations and print any relevant statistics to the console.

---

## Results

- Charts are rendered to the default R plot window.
- Each figure conveys a specific insight about football match characteristics, either real or modeled (e.g., simulated goals).
- Mapping highlights spatial performance differences among host nations.

---

## License

This project is released under the MIT License – free to use, modify, and distribute.

---

## Acknowledgments

Thanks to all contributors of the datasets and the R community for open-source packages that enable such analyses.