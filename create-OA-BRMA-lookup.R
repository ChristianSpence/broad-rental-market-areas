# create OA21 to BRMA lookup

# load BRMA boundaries (available at https://www.gov.uk/government/publications/broad-rental-market-area-boundary-layer-for-geographical-information-system-gis-applicable-may-2020)
brma <- sf::read_sf("data-raw/local-housing-allowance/GML/English BRMA(LHA) Layer.gml")

# brma has no CRS set on it, but it is BNG (27700), so we need to fix that, as well a small side location conflict on one of the geometries. {sf} makes this easy
brma <- brma |>
  sf::st_make_valid() |>
  sf::st_set_crs(27700)

# load population weighted centroids for 2021 OAs (available at https://geoportal.statistics.gov.uk/datasets/ons::output-areas-dec-2021-pwc-version-2/explore)
pwc_oa <- sf::read_sf("~/Data/Geodata/Boundaries/Output_Areas_Dec_2021_PWC_Version_2_2022_-4132072751711419500.geojson")

# join 'em together with sf::st_within()
oa_in_brma <- sf::st_join(pwc_oa, brma, join = sf::st_within)

# before we write out just the columns we need to a CSV, we'll need to remove the "sf" class as it won't let us remove the geometry column if it's there
OA21_BRMA20_LU <- oa_in_brma
class(OA21_BRMA20_LU) <- class(OA21_BRMA20_LU)[class(OA21_BRMA20_LU) != "sf"]

# select and rename the columns we need
OA21_BRMA20_LU <- OA21_BRMA20_LU |>
  dplyr::select(FID, OA21CD, BRMA20CD = LOCALITY_ID, BRMA20NM = Name)

# and write-out
readr::write_csv(OA21_BRMA20_LU, "~/Data/Geodata/Lookups/OA21_BRMA20_LU.csv")
