# Query evidence

[Download the original result exports](query_results_2026-11-03.zip). The ZIP preserves the 14 result files supplied in chat. These are aggregate query results from the public Citi Bike data, not individual trip records. Export names do not supply executed SQL, job byte counts or independent lineage verification. The archive is retained in this private repository so progress does not depend on Downloads paths.

| File inside archive | Purpose |
|---|---|
| `job_Spdg3YfbCTo7w0-CjLYhrFgC0bEr.json` | Exploratory 1% block sample — not exact daily totals |
| `job_JFaL3285MHqaYwlZFzh69KX7sumV.csv` | KPI 1 — daily/hourly trip counts |
| `job_fTPykmDMO2A8cFGzCNa1JXVuHLqM.csv` | KPI 2 — monthly duration |
| `job_ttfGqIWCVUOOQCqC4A0gVRTR19IV.csv` | KPI 3 — daily bikes used |
| `job_kAxVFzyWWdflP98O4jCTu4Gj0HXc.csv` | KPI 4 — origin/destination demand |
| `job_VDm3_PUltPUauS7PyQO1we_sMcrU.csv` | KPI 5 — station net flow |
| `job_TSx1lF1iwMHZOM_dyP0CUW0ZOvI_.csv` | KPI 6 — same-station rate |
| `job_q2jppTD6TLR0rtlypzLskOeSdLUm.csv` | KPI 7 — all-period rider mix |
| `job_mF6qADXxjtE8rOJw3yvakOa6XKoW.csv` | KPI 8 — trips per bike ID |
| `job_dYR4Xov5LctYH5-OQhr0nRfz4zs9.csv` | KPI 9 — latest station status (table lineage to confirm) |
| `job_aCYeilwBtTyz2Y26_r7wTWShHZza.csv` | KPI 10 — station coverage (table lineage to confirm) |
| `job_IcHj9QNgVvyVgn_CQqHpGnGwWmQ8.csv` | Follow-up — monthly rider mix and timestamp coverage |
| `job_JHiXo775pTyb2rWQfqp4lVuiHSph.csv` | Follow-up — duration by month/user type |
| `job_S3YWkIGz-PfzZLKnTnlJ2wv-EfDA.csv` | Follow-up — Customer duration bands |

The early JSON is sampled output and must not be used as exact totals. Later full query outputs supersede its exploratory interpretations. The timestamp-check result is not in this archive because it has not been supplied. Original result files are unchanged. No human audit approval is inferred from supplying or uploading exports.
