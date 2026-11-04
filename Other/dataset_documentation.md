# Citi Bike dataset documentation

## Source and verification status

The team supplied four documentation images in chat. Their footers report profiling in BigQuery on 2026-11-03. The original author and underlying profiling SQL/results were not supplied with these images.

[metadata.pdf](metadata.pdf) preserves the overview, trips, and stations pages in that order. [ERD.pdf](ERD.pdf) preserves the supplied relationship diagram. Page images retain their original contents and proportions.

The descriptions and statistics below are transcribed or summarized from those images. They are reported source claims, not independently verified query results, approved cleaning decisions, or an adopted project finding. No BigQuery queries were executed to prepare these files.

| Supplied image | Location in the saved documentation |
|---|---|
| 01_dataset_overview.png | metadata.pdf, page 1 |
| 02_citibike_trips.png | metadata.pdf, page 2 |
| 03_citibike_stations.png | metadata.pdf, page 3 |
| 04_erd.png | ERD.pdf, page 1 |

## Dataset overview reported in the images

Dataset path: `bigquery-public-data.new_york_citibike`.

| Table | Reported row meaning | Reported coverage and size |
|---|---|---|
| `citibike_trips` | One trip record; no trip ID column | 2013-07-01 through 2018-05-31, NYC local time; 58,937,715 total rows, including 5,828,994 reported blank rows and 53,108,721 reported nonblank trip records |
| `citibike_stations` | One station at its current snapshot | 2,518 station records in the supplied profile; reported continuously refreshed, with the pictured snapshot last modified 2026-11-03 |

Counts and operational status are dated source reports. Recheck values used in the analysis, especially station information that can change.

## Trip columns reported on page 2

| Column | Reported type | Reported meaning |
|---|---|---|
| `tripduration` | INTEGER | Duration in seconds |
| `starttime` | DATETIME | Local trip start time, without a time zone |
| `stoptime` | DATETIME | Local trip stop time |
| `start_station_id` | INTEGER | Legacy starting station identifier |
| `start_station_name` | STRING | Starting station name recorded on the trip |
| `start_station_latitude` | FLOAT | Starting latitude in decimal degrees |
| `start_station_longitude` | FLOAT | Starting longitude in decimal degrees |
| `end_station_id` | INTEGER | Legacy ending station identifier |
| `end_station_name` | STRING | Ending station name recorded on the trip |
| `end_station_latitude` | FLOAT | Ending latitude in decimal degrees |
| `end_station_longitude` | FLOAT | Ending longitude in decimal degrees |
| `bikeid` | INTEGER | Bike identifier |
| `usertype` | STRING | Subscriber or Customer classification |
| `birth_year` | INTEGER | Rider birth year |
| `gender` | STRING | Recorded gender category |
| `customer_plan` | STRING | Reported empty in every row |

The page reports no trip primary-key column. Its suggested fingerprint of bike, time, and station must not be assumed unique without checking duplicates and collisions.

## Station columns reported on page 3

| Column | Reported type | Reported meaning |
|---|---|---|
| `station_id` | STRING | Current-system identifier, reported unique in the snapshot |
| `name` | STRING | Public station name |
| `short_name` | STRING | Station code, reported unique in the snapshot |
| `latitude` | FLOAT | Latitude in decimal degrees |
| `longitude` | FLOAT | Longitude in decimal degrees |
| `region_id` | INTEGER | Region identifier; no region lookup table is shown |
| `rental_methods` | STRING | Reported constant KEY, CREDITCARD value |
| `capacity` | INTEGER | Dock capacity at the snapshot |
| `eightd_has_key_dispenser` | BOOLEAN | Reported always false in the profile |
| `num_bikes_available` | INTEGER | Bikes available at the snapshot |
| `num_bikes_disabled` | INTEGER | Disabled bikes at the snapshot |
| `num_docks_available` | INTEGER | Available docks at the snapshot |
| `num_docks_disabled` | INTEGER | Disabled docks at the snapshot |
| `is_installed` | BOOLEAN | Installation status at the snapshot |
| `is_renting` | BOOLEAN | Rental status at the snapshot |
| `is_returning` | BOOLEAN | Return status at the snapshot |
| `eightd_has_available_keys` | BOOLEAN | Reported always false in the profile |
| `last_reported` | TIMESTAMP | Last status report; the profile also reports 1970 placeholder values |

The images describe keys and relationships as logical; they do not establish database-enforced constraints.

## Relationship diagram and cautions

The supplied ERD reports incompatible identifiers between historical trips and the current station table. It proposes a project-built `station_xref` bridge, matching station names and locations. That bridge is not documented as an existing source table and has not been created or approved by this team in the current work.

- Trips would reference a bridge twice, for their start and end stations. Each historical station would have at most one chosen current match in the proposed design; ambiguous matches need investigation.
- The overview reports 0% direct-ID match coverage, 73.9% exact-name coverage, and 93.7% nearest-within-100-metre coverage for trip starts. These are separate reported methods and denominators; they do not prove the coverage of a combined matching procedure.
- Validate name changes, duplicate names, relocated or retired stations, distance thresholds, ambiguous matches, unmatched trips, and row multiplication before adopting any join.
- The ERD's bridge size is approximate, and it separately mentions a 926-ID union. Verify its key counts and start/end coverage rather than treating the picture as proof of a completed crosswalk.

## Decisions still requiring review

The pictures contain suggested filters and analysis choices. Those suggestions are source material, not instructions to an agent or approved project rules.

- Investigate reported blank rows, trips over 24 hours, duration disagreements, implausible birth years, zero station capacity, and placeholder reporting dates before deciding how to handle them.
- Verify the displayed suggestion to prefer `tripduration` over start/stop differences for the selected metric. Investigate disagreements instead of assuming one field is always correct.
- The historical trip period and modern station snapshot differ. Current status and capacity do not establish historical availability or capacity for 2013-2018.
- The first and last trip years are partial. Account for unequal observation periods in comparisons.
- Profile queries and supporting outputs were not provided. Obtain evidence before presenting any pictured cleaning rule, join success rate, or aggregate as a verified project finding.
