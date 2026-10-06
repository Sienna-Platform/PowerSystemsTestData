# IEEE 9-bus PCM time-series test cases

PSS/E `.raw` and `.dyr` files adapted from [rodrigomha/IEEE9Bus-EPICS](https://github.com/rodrigomha/IEEE9Bus-EPICS).

- `ieee9_v32.raw` — original IEEE 9-bus network (reference topology).
- `RTS_Esc487MW.raw` / `RTS_CtrlsModified_STAB1.dyr` — scaled load scenario with dynamic models for thermal-only catalog builds.
- `RTS_Esc487MW_RE.raw` / `RTS_CtrlsModified_RE.dyr` — renewable-replacement scenario with inverter dynamic data.

Load profiles and production-cost parameters are attached at build time from the RTS-GMLC catalog via `PowerSystemCaseBuilder.jl`.
