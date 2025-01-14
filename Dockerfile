# Base R Shiny image
FROM rocker/shiny

# Make a directory in the container
RUN mkdir /home/shiny-app

# Install R dependencies
RUN R -e "install.packages(c('shinythemes','shiny','RPostgres','DBI','ggplot2','stringr','leaflet','sf','shinyWidgets','dplyr', 'tidyr', 'viridis'),repos='https://ftp.osuosl.org/pub/cran/')"

# Copy the Shiny app code
COPY . /home/shiny-app/

# Expose the application port
EXPOSE 8180

# Run the R Shiny app
CMD R "shiny::runApp('/home/shiny-app/')"