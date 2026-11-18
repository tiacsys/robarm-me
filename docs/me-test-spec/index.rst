ME Test Specification
=====================

This document lists the ME test cases (``ME-TC``) and the ME requirements each one verifies.

.. note::

   No ME test case yet: there is no ME requirement to verify (``me-req``), and the canary assembly
   has no test of its own.

What will go here
-----------------

* the ME test cases (``.. me-tc::``), each with the ``ME-REQ`` it verifies, its method (test,
  inspection, analysis, demonstration) and its setup;
* measurements on printed and assembled parts (dimensions, fit, mass), recorded like the
  integration tests.

What is not an ME test
----------------------

The design checks of ``curatrix check robarm-me`` are not test cases: recompute (CK-F4c), valid
solids (CK-F16), collisions (CK-F17), the board inside its space budget (CK-F18), the model
parameters in FreeCAD (CK-F3). They check the design files against rules and the model, not a
built part against a requirement, and verify no ``ME-REQ``. Their findings are in the assembly
documents (``asm-<assembly>``, section "Findings") and in the check run.
