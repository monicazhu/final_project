
#add correct file path
here::i_am(
  "code/02_make_figures.R"
)

# read the dataset from the output directory
data <- readRDS(
  file = here::here("output/data.rds")
)



# make figures of graphical analysis
#| fig.align = "center",
#| out.width = "600px"
library(ggplot2)

scatterplot <-
  ggplot(data, aes(x = age, y = platelets)) +
    geom_point() +
    geom_smooth(method = lm) +
    theme_bw()

ggsave(
  here::here("output/scatterplot.png"),
  plot = scatterplot,
  device = "png"
)
