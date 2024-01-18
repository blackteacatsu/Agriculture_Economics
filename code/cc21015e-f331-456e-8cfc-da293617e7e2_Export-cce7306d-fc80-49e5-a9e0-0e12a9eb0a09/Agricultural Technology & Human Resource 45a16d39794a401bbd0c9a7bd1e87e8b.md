# Agricultural Technology & Human Resource

Owner: Kris Su Verification: Verified

### Developed countries versus developing countries

In this section, we will be looking the impact draws on the human capital development by the implementation of agricultural technology such as synthetic fertilizers and pesticides.

### 👷‍♂️Brics

Formed in 2001, representing major emerging economies:

-   Brazil
-   Russia
-   India
-   China
-   South Africa

### 🧑‍💻G7

Group of Seven, is an assembly of advanced economies:

-   United States
-   Japan
-   Germany
-   United Kingdom
-   France
-   Italy
-   Canada

Here, the variable we will be dealing w/, *year* and *nitrogen fertilizer use*, the former has an ordinal level of measurement, whereas the latter is measured in interval-ratio. Therefore, I will be using the x-axis of the graph as the timeline, and display the amount of fertilizer used per hectare vertically. Figure A uses the geom_point function, obviously showing the data in such a way is not every effective in term of grouping the data for each countries together although they are already colour coded base by nation.

![fertilizer_use.png](Agricultural%20Technology%20&%20Human%20Resource%2045a16d39794a401bbd0c9a7bd1e87e8b/fertilizer_use.png)

### Make the figures moving

This figure below shows an animated variant of B in the previous pair using `gganimate` library. Which is a complementary library designed to implement with the og `ggplot` library,

``` r
library(gganimate)
library(ggplot)

plt <- ggplot(data = ) + geom_line(...)

plt +
    transition_reveal(Year)
```

![plt1.gif](Agricultural%20Technology%20&%20Human%20Resource%2045a16d39794a401bbd0c9a7bd1e87e8b/plt1.gif)

### 👩‍🎓The Human-Dev.-Index

![plt4.gif](Agricultural%20Technology%20&%20Human%20Resource%2045a16d39794a401bbd0c9a7bd1e87e8b/plt4.gif)

![plt5.gif](Agricultural%20Technology%20&%20Human%20Resource%2045a16d39794a401bbd0c9a7bd1e87e8b/plt5.gif)

### Source tracing

[Economic Growth](https://ourworldindata.org/economic-growth#all-charts)

[Fertilizers](https://ourworldindata.org/fertilizers)

[Pesticides](https://ourworldindata.org/pesticides)
