ME Design
=========

This document holds the mechanical design of the robot arm: the assembly and port defs of the ME
model, how they refine the system model, and an overview of the assemblies. The ME requirements are
in the ME Requirements Specification (``me-req``), the ME tests in ``me-test-spec`` and
``me-test-report`` (V-model split, tiacsys/xdmod#69 decision Q8). Each top-level assembly has its
own document (``asm-<assembly>``, in ``docs/assemblies/``).

.. note::

   This is a skeleton. The content comes in Phase 6.

What will go here
-----------------

* the design decisions that span assemblies (materials, fasteners, printing), with the ME
  requirements each one meets;
* an overview of the assemblies and shared parts; the parameters, drawings and 3D views of each
  assembly are in its ``asm-<assembly>`` document.

The elements of the ME model (assembly defs ``ME-ASM``, port defs ``ME-PORT``) are needs; the
assembly documents (``asm-<name>``) link to them. They are imported here from the generated model
needs:

.. needimport:: /generated/model-needs.json

How the ME model refines the system model: the assembly realizes a system element, the board
seat conforms to the board's space budget (XD-ADR-0132, XD-ADR-0134):

.. sysml-view:: /views/meAllocation.drawio.svg
   :caption: ME elements and the system elements and interfaces they realize or conform to (view meAllocation)

The canary assembly, its parts and its ports (the assembly document ``asm-canary-assembly``
shows the same views):

.. sysml-view:: /views/canaryAssemblyParts.drawio.svg
   :caption: Parts of the canary assembly (view canaryAssemblyParts)

.. sysml-view:: /views/canaryAssembly.drawio.svg
   :caption: The canary assembly and its ports, the mount and the board seat (view canaryAssembly)

Parts with a trace ID in FreeCAD become needs too. They are imported here from the generated
file:

.. needimport:: /generated/cad-needs.json
