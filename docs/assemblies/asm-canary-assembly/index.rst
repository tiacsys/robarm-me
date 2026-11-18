Canary Assembly (asm-canary-assembly)
=====================================

This document describes the assembly ``canary-assembly`` (``ME-ASM-0001``): the FreeCAD top document
``assemblies/canary-assembly/canary-assembly.FCStd``, its skeleton ``canary-assembly-skeleton.FCStd`` and the assembly
def of the ME model it implements. It was made by ``curatrix new asm``; every assembly document has
the same sections (ME-4, XD-ADR-0129). Parameters, materials, interfaces and the BOM come from the
FreeCAD files and the ME model in plain Python; drawings, exploded view, renderings, mass and
findings come from the local ``curatrix cam`` output of the current commit and are not part of CI
builds.

Overview
--------

.. xd-asm-overview:: canary-assembly

Block diagrams
--------------

The assembly def of the ME model: its parts, and its ports (from the model; ``curatrix views build``):

.. sysml-view:: /views/canaryAssemblyParts.drawio.svg
   :caption: Parts of the canary assembly (view canaryAssemblyParts)

.. sysml-view:: /views/canaryAssembly.drawio.svg
   :caption: The canary assembly and its ports (view canaryAssembly)

Drawings
--------

.. xd-asm-drawing:: canary-assembly

Exploded view
-------------

.. xd-asm-exploded:: canary-assembly

Renderings
----------

.. xd-asm-renderings:: canary-assembly

Mass and center of gravity
--------------------------

.. xd-asm-mass:: canary-assembly

Parameters
----------

.. xd-asm-parameters:: canary-assembly

Materials
---------

.. xd-asm-materials:: canary-assembly

Interfaces
----------

.. xd-asm-interfaces:: canary-assembly

Findings
--------

.. xd-asm-findings:: canary-assembly

Sub-assemblies
--------------

.. xd-asm-subassemblies:: canary-assembly

Appendix: bill of materials
---------------------------

.. xd-asm-bom:: canary-assembly
