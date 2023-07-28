# broad-rental-market-areas
Useful data for working with Broad Rental Market Areas (BRMA)

I was working on a project where I needed a lookup between Broad Rental Market Areas (used to define how Local Housing Allowance rates are set) and statistical and administrative geographies. I was only able to find a few links to either (a) outdated sets, from 2001 boundaries, or (b) commercially available sets with, erm, generous pricing for the supplier.

So, I needed it, made it, and it's here.

I used the BRMA boundaries published on gov.uk [here](https://www.gov.uk/government/publications/broad-rental-market-area-boundary-layer-for-geographical-information-system-gis-applicable-may-2020) and the population-weighted centroids for 2021 Census Output Areas from [here](https://geoportal.statistics.gov.uk/datasets/ons::output-areas-dec-2021-pwc-version-2/explore) and built this lookup using the `sf` package in R.

Please feel free to raise any issues in this repo and share around.
