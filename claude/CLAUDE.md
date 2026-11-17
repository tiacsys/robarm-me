# robarm-me: rules for agents

Read the workspace `CLAUDE.md` (copied from `xdmod/launch/CLAUDE.md`) first. This file adds the
rules of this repo. Run every command from the workspace root.

## What this repo is

Mechanical design in FreeCAD: parts (`parts/`), assemblies (`assemblies/<asm>/`), local library
parts (`lib/`), TechDraw templates (`templates/`), print profiles (`print/`), scripted ME checks
(`tests/`), and one document, `docs/me-design/` (D135).

## Rules

- **Start FreeCAD only through `curatrix launch freecad`.** It uses a workspace-local config that
  saves `.FCStd` files uncompressed (D63). A compressed file fails CK-H1.
- **Trace fields** are object properties (group `Trace`): `TraceID` (`ME-PART`, `ME-ASM`),
  `Realizes`, `Satisfies`, `Conforms`, `PartOf`, `Status`, `Configs`, `Port` (on an LCS: the
  `ME-PORT`). `ME-ASM` and `ME-PORT` belong to the ME model (`model/`); the top document of an
  assembly carries its `ME-ASM` only as `TraceID` on the assembly object, without link fields
  (XD-ADR-0128).
- **Assemblies** (XD-ADR-0137): a new assembly def in `model/`, then `curatrix new asm <Def>
  --repo robarm-me` (folder, top document, `skeleton.FCStd`, `asm-<name>` document). One FreeCAD
  link per usage in the model (CK-F15); parts refer only to the skeleton, never to the top
  document (CK-F14). Placeholders inside
  `.FCStd` are refused: ask for an ID with `curatrix ids new ME-PART` and set it in FreeCAD.
- After a FreeCAD change: `curatrix gen all robarm-me` (cad-needs and semantic JSON in
  `generated/freecad/`), and commit them with the `.FCStd`.
- `.FCStd` files cannot be merged (`-merge` in `.gitattributes`). On a conflict, take one side
  and redo the other change.
- For a PR that changes `.FCStd` files, look at the local review report
  (`build/robarm-me/review/<branch>/`) and summarize it in the PR (D135; Pages previews later).

## Pitfalls

- Saving an unchanged document still changes the file. The pre-commit hook warns when a `.FCStd`
  changed but its semantic JSON did not: then drop the change.
- Rebuilding a part from a script changes internal object IDs, which makes a large diff. Edit
  parameters instead.
- PR CI has no FreeCAD (D56). CAD-derived needs reach CI only through the committed
  `generated/cad-needs.json`.
