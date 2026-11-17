# Local parts library

Parts that are not in the FreeCAD parts library (`libs/freecad/`, D88), for example a servo
model or a breakout board outline. `curatrix launch freecad` gives FreeCAD the path of the
workspace parts library; the user's own FreeCAD setup is not used.

Standard fasteners sit here too, one document per size, named after the standard
(`iso7380-1-m3x6.FCStd`: button head screw ISO 7380-1 M3x6). The fastener object carries its
standard designation in `Standard` (`ISO 7380-1 M3x6, A2`) instead of Manufacturer and MPN, its
`Material` for the mass, and a `TraceID` (`ME-PART`), so the ME model can count its usages.
