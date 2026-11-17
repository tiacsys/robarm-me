ME Requirements and Design
==========================

This document holds the mechanical requirements of the robot arm and the mechanical design that
meets them.

.. note::

   This is a skeleton. The content comes in Phase 6.

What will go here
-----------------

* the ME requirements, written as EARS sentences, each refining a system requirement;
* the assemblies and parts, with their parameters (read from the FreeCAD spreadsheets),
  drawings and 3D views;
* the ME test cases and their results.

In iteration 1 this is one document. It will be split into a requirements document, an assembly
design document and test documents once that content exists.

The elements of the ME model (assembly defs ``ME-ASM``, port defs ``ME-PORT``) are needs; the
assembly documents (``asm-<name>``) link to them. They are imported here from the generated model
needs:

.. needimport:: /generated/model-needs.json

How the ME model refines the system model: the assembly realizes a system element, the board
seat conforms to the board's space budget (XD-ADR-0132, XD-ADR-0134):

.. sysml-view:: /views/meAllocation.drawio.svg
   :caption: ME elements and the system elements and interfaces they realize or conform to (view ``meAllocation``)

The canary assembly, its parts and its ports (the assembly document ``asm-canary-assembly``
shows the same views):

.. sysml-view:: /views/canaryAssemblyParts.drawio.svg
   :caption: Parts of the canary assembly (view ``canaryAssemblyParts``)

.. sysml-view:: /views/canaryAssembly.drawio.svg
   :caption: The canary assembly and its ports, the mount and the board seat (view ``canaryAssembly``)

Parts with a trace ID in FreeCAD become needs too. They are imported here from the generated
file:

.. needimport:: /generated/cad-needs.json
