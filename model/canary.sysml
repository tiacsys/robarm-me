// ME domain model (XD-ADR-0130): the canary assembly. It refines the system model of
// robarm-syseng by specialization; curatrix derives `realizes` from `:>` (XD-ADR-0132). The
// FreeCAD top document assemblies/canary-assembly/canary-assembly.FCStd names the assembly by its
// ID (TraceID, a reference only, XD-ADR-0128).
// SPDX-License-Identifier: Apache-2.0
package RobArmMe {
    doc /* The mechanical domain model of the robot arm. */
    private import XdTrace::*;
    private import XdDomain::*;
    private import SI::*;

    public package Canary {
        // The canary part assemblies/canary-assembly/parts/canary-part.FCStd: an own part of the
        // canary assembly (it takes its main dimension from the assembly's skeleton, task 5.24).
        // ME-PART stays owned by the FreeCAD file (XD-ADR-0128); the short name is a reference to it, so the model can count its usages.
        part def <'ME-PART-0001'> CanaryPart;

        // The mounting interface of the canary assembly: an LCS with Port = this ID in the
        // skeleton (XD-ADR-0133). It conforms to no SYS-IF (allowed for ports).
        port def <'ME-PORT-0001'> CanaryMount :> MechanicalPort {
            doc /* Two holes on the top face of the canary part. */
            attribute holeSpacing = 12 [mm];
        }

        // The canary assembly realizes the canary unit. It has one usage of the canary part, so
        // its top document has exactly one FreeCAD link to it (CK-F15, XD-ADR-0138).
        // Its parameters (XD-ADR-0137) reach FreeCAD through `curatrix gen freecad-params`: the
        // aliases canaryPart_length, mount_x, mount_y, mount_z and mount_holeSpacing in the
        // spreadsheet Params of canary-assembly-skeleton.FCStd; the master sketch takes
        // canaryPart_length, the part its length from the master sketch, the LCS of the mount its position from Params (CK-F3).
        part def <'ME-ASM-0001'> CanaryAssembly :> RobArmProduct::Canary::CanaryUnit, Assembly {
            doc /* The canary assembly (canary step C2): the canary part, placed once. */
            part canaryPart : CanaryPart {
                attribute length = 20 [mm] { @ModelMatchTolerance { value = 0.01; } }  // model-to-CAD agreement, not a print tolerance
            }
            port mount : CanaryMount {
                :>> x = 10 [mm];
                :>> y = 5 [mm];
                :>> z = 5 [mm];
            }
        }
    }
}
