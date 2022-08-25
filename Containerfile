FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN apt-get update ; \
    apt-get install -y texlive-full python-dev libbz2-dev libxt-dev nano; \ 
    apt-get clean

RUN R -e "install.packages(c('tidyverse', 'cmdstanr','tidybayes', 'rstan', 'shinystan', 'loo', 'coda', 'HDInterval', 'testthat', 'MASS', 'palmerpenguins', 'packrat', 'rsconnect'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

USER $NB_USER

