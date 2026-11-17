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

Parts with a trace ID in FreeCAD become needs too. They are imported here from the generated
file:

.. needimport:: /generated/cad-needs.json
