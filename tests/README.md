# ME checks

Scripted ME checks, for example FreeCAD parameters against the system model (CK-F3) and a
recompute of every document without errors (CK-F4). Each check writes JUnit XML to
`build/robarm-me/` and is listed as a command in `checks.yaml`. Tests of system requirements
belong to robarm-integration (D115).
