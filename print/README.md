# Print settings

Print profiles for 3D-printed parts (XD-ADR-0024): `<name>.ini`, named by the `PrintProfile`
property of a printed part. `curatrix cam robarm-me <asm>` copies the profile next to the part's
3MF and STL under `build/` (task 5.26); no G-code, nothing of the output is committed.

| Profile | For |
|---|---|
| `pla-standard.ini` | PLA, 0.2 mm layers, 0.4 mm nozzle; the canary part |
