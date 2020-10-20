FROM rocker/r-base:4.0.3

LABEL author="marc.jones@crick.ac.uk" \
      description="Base R container with my commonly used packages installed"

RUN apt-get update 

RUN apt-get install -y --no-install-recommends \
      # devtools
      libxml2-dev \
      libcurl4-gnutls-dev \
      libssl-dev \
      # ggplot
      libudunits2-dev \
      libfontconfig1-dev \
      libgeos-dev \
      libcairo2-dev \
      libgdal-dev

RUN install2.r -e devtools

RUN R -e "library(devtools);install_version('ggplot2', version='3.3.2', dependencies=TRUE)"
RUN R -e "library(devtools);install_version('BiocManager', version='1.30.10', dependencies=TRUE)"
RUN R -e "library(BiocManager);BiocManager::install('GenomicRanges', version='3.11')"

WORKDIR /home
