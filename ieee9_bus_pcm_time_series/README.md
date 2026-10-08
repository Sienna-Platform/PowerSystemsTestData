# IEEE 9-bus PCM time-series test cases

## Files

- `ieee9_v32.raw` — original IEEE 9-bus network (reference topology).
- `RTS_Esc487MW.raw` / `RTS_CtrlsModified_STAB1.dyr` — scaled load scenario with sync-machine dynamics. **Both** catalog builds parse these files.
- `RTS_Esc487MW_RE.raw` / `RTS_CtrlsModified_RE.dyr` — upstream EPICS renewable-scenario files kept for **provenance only**; the catalog builder does **not** open them.

## Catalog composition (RE)

`PowerSystemCaseBuilder` catalog name: `IEEE 9 Bus with PCM Time Series and RE`  
Description: `IEEE 9-bus PCM TS with GFM solar at bus 2`

Single intentional difference vs `"IEEE 9 Bus with PCM Time Series"`: unused CT (`generator-2-1`) is removed and replaced by one capped VirtualInertia GFM solar on bus 2. Coal (`generator-1-1`) stays as REF; gen-3 stays sync (same STAB1 DYR models as base).

| Unit | Role |
|---|---|
| `generator-1-1` | Sync coal REF (STAB1 DYR; unchanged vs base) |
| `generator-3-1` | Sync machine (STAB1 DYR; not REGCA) |
| `GFM_Bus_2` | `RenewableDispatch` (PVe) + VSM `DynamicInverter` on bus 2; rating **100 MW**; RTS TS `101_PV_1` |

No stiff `Source`, no REGCA PV/Wind add-ons, no bus-3 IBR. The builder **hard-deletes** `generator-2-1` (and its `DynamicGenerator`). The thermal-heavy counterpart remains `"IEEE 9 Bus with PCM Time Series"`.

Load profiles and thermal production-cost parameters are attached at build time from the RTS-GMLC catalog via `PowerSystemCaseBuilder.jl` (`modified_RTS_GMLC_DA_sys_noForecast`). Bus-2 CT start/shutdown is floored to at least Bus-3 CC’s. Showcase E Ops additionally starts the CT offline before UC so it is not held at Pmin (GAST cannot initialize there for Dyn handoff).

## Attribution / license

### PSS/E RAW and DYR (IEEE9 / EPICS)

Adapted from [rodrigomha/IEEE9Bus-EPICS](https://github.com/rodrigomha/IEEE9Bus-EPICS). As of this writing, that repository publishes **no** `LICENSE` / `NOTICE` / `COPYING` file and GitHub reports `license: null`. No SPDX license is invented here; retain upstream attribution when redistributing these files.

### Load / cost / renewable time-series parameters (RTS-GMLC)

Parameters come from [GridMod/RTS-GMLC](https://github.com/GridMod/RTS-GMLC) via `PowerSystemCaseBuilder`. Upstream provides no separate `LICENSE` file; the project README includes a **DATA USE DISCLAIMER AGREEMENT**. A verbatim copy is in [`NOTICE_RTS-GMLC.md`](NOTICE_RTS-GMLC.md) in this folder.
