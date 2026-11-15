# Parts

Single parts, one `<part>.FCStd` file each. Rules (D63, freecad-storage.md):

* Save with compression level 0. `curatrix launch freecad` sets this for you; `curatrix check`
  rejects compressed files (CK-H1).
* Each part carries its trace ID in the object property `TraceID` (`ME-PART-nnnn`), and its
  links in `Realizes`, `Satisfies`, `Conforms`, `Status` and `Configs`.
* Commit the semantic JSON with the part: `curatrix gen freecad-json robarm-me` writes
  `generated/freecad/<path>.FCStd.json`, which git and GitHub can diff as text.
* `.FCStd` files cannot be merged. On a conflict, take one side and redo the other change.
