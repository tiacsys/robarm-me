# robarm-me

Mechanical engineering of the robot arm example of [XDMOD](https://github.com/tiacsys/xdmod):
FreeCAD parts and assemblies, drawing templates, print settings, and the ME design document.

Status: **skeleton** (Phase 4). The structure, the checks and an empty document are in place; the
content comes in Phase 6.

## Layout

| Path | What |
|---|---|
| `parts/` | single parts, `<part>.FCStd` (saved uncompressed) |
| `assemblies/<asm>/` | one folder per assembly |
| `lib/` | local parts that the FreeCAD parts library does not have |
| `templates/` | TechDraw templates with fields for git values |
| `print/` | print-settings profiles |
| `tests/` | scripted ME checks |
| `generated/cad-needs.json` | needs read from the FreeCAD files (generated, committed) |
| `generated/freecad/` | semantic JSON of each `.FCStd` for readable diffs (generated, committed) |
| `docs/me-design/` | ME Requirements and Design: ME requirements, assemblies and parts |
| `ids.yaml` | ID ledger for `ME-*` IDs |
| `checks.yaml` | what `curatrix check robarm-me` runs |
| `claude/` | rules and skills for agents working in this repo |

In iteration 1 there is one document. It is split into requirements, assembly design and test
documents once that content exists.

## Use

This repo is a west project of the [robarm-manifest](https://github.com/tiacsys/robarm-manifest)
workspace. Run every command from the workspace root:

```sh
curatrix launch freecad parts/<part>.FCStd    # FreeCAD with the workspace settings
curatrix gen all robarm-me                    # update cad-needs.json and the semantic JSON
curatrix check robarm-me --stage local        # all checks, as before a push
```

`.FCStd` files are zip files. They are saved uncompressed, and the workspace bootstrap sets up a
git diff driver (`fcstd`) that shows their content as JSON. They cannot be merged.

## Licence

Apache-2.0, see `LICENSE`.
