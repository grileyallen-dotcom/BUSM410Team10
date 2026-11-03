# Evidence files

All 18 attachments supplied in this chat are saved individually below: 13 CSV query results, one exploratory JSON result, and four schema/preview screenshots. Filenames describe each measure. File contents are unchanged; original filenames, byte counts and Git blob hashes are preserved in [manifest.json](manifest.json).

## Query results

| Title | Original filename |
|---|---|
| [Exploratory sampled daily rider counts](query_results/00_exploratory_sample_daily_rider_counts.json) | `job_Spdg3YfbCTo7w0-CjLYhrFgC0bEr.json` |
| [KPI 1: Trips by date and hour](query_results/01_trips_by_date_and_hour.csv) | `job_JFaL3285MHqaYwlZFzh69KX7sumV.csv` |
| [KPI 2: Monthly trip duration](query_results/02_monthly_trip_duration.csv) | `job_fTPykmDMO2A8cFGzCNa1JXVuHLqM.csv` |
| [KPI 3: Daily trips per bike used](query_results/03_daily_trips_per_bike_used.csv) | `job_ttfGqIWCVUOOQCqC4A0gVRTR19IV.csv` |
| [KPI 4: Station departures and arrivals](query_results/04_station_departures_and_arrivals.csv) | `job_kAxVFzyWWdflP98O4jCTu4Gj0HXc.csv` |
| [KPI 5: Station net flow](query_results/05_station_net_flow.csv) | `job_VDm3_PUltPUauS7PyQO1we_sMcrU.csv` |
| [KPI 6: Same-station trip rate](query_results/06_same_station_trip_rate.csv) | `job_TSx1lF1iwMHZOM_dyP0CUW0ZOvI_.csv` |
| [KPI 7: Rider mix, all periods](query_results/07_rider_mix_all_periods.csv) | `job_q2jppTD6TLR0rtlypzLskOeSdLUm.csv` |
| [KPI 8: Trips by bike ID](query_results/08_trips_by_bike_id.csv) | `job_mF6qADXxjtE8rOJw3yvakOa6XKoW.csv` |
| [KPI 9: Station availability snapshot](query_results/09_station_availability_snapshot.csv) | `job_dYR4Xov5LctYH5-OQhr0nRfz4zs9.csv` |
| [KPI 10: Station coverage by region](query_results/10_station_coverage_by_region.csv) | `job_aCYeilwBtTyz2Y26_r7wTWShHZza.csv` |
| [Monthly rider mix and timestamp coverage](query_results/11_monthly_rider_mix_and_timestamp_coverage.csv) | `job_IcHj9QNgVvyVgn_CQqHpGnGwWmQ8.csv` |
| [Trip duration by month and rider type](query_results/12_trip_duration_by_month_and_rider_type.csv) | `job_JHiXo775pTyb2rWQfqp4lVuiHSph.csv` |
| [Customer duration bands, May 2017 and May 2018](query_results/13_customer_duration_bands_may_2017_2018.csv) | `job_S3YWkIGz-PfzZLKnTnlJ2wv-EfDA.csv` |

## Schema and data previews

| Title | Original filename |
|---|---|
| [Citi Bike stations: schema](schema_screenshots/01_citibike_stations_schema.png) | `Screenshot 2026-11-02 at 7.31.36 PM.png` |
| [Citi Bike stations: data preview](schema_screenshots/02_citibike_stations_preview.png) | `Screenshot 2026-11-02 at 7.32.02 PM.png` |
| [Citi Bike trips: schema](schema_screenshots/03_citibike_trips_schema.png) | `Screenshot 2026-11-02 at 7.32.23 PM.png` |
| [Citi Bike trips: data preview](schema_screenshots/04_citibike_trips_preview.png) | `Screenshot 2026-11-02 at 7.32.29 PM.png` |

The screenshot previews show only the visible rows and do not independently verify full-table quality or coverage. The stations screenshots contain station metadata/status fields; the trips screenshots contain historical trip fields.

## Interpretation and lineage

- The exploratory JSON is a block-sampled result and does not contain exact daily trip totals.
- The CSVs are aggregate query outputs, not individual trip records. Result exports do not include submitted SQL text, actual processed/billed bytes, or independent table-lineage verification.
- KPI 9 and KPI 10 contain station-only fields from the supplied station schema. The statement that all queries used only the trip table conflicts with those fields. Confirm submitted SQL before relying on their lineage.
- The final timestamp-check query is still pending; no corresponding result has been supplied.
- Refer to the [scorecard](../analysis/kpi_scorecard.md), [time-series investigation](../analysis/time_series_investigation.md) and [SQL notes](../sql/notes.md) for supported findings and limitations.
- The [original 14-result ZIP](query_results_2026-11-03.zip) remains as an additional backup under the original filenames. Screenshots are in the individual files above.

Upload date: November 3, 2026. Matching upload hashes establish file preservation, not team validation of the analysis. No human audit approval is inferred from an upload.
