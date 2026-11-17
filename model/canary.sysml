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
        // The canary part assemblies/canary-assembly/parts/canary-part.FCStd: the base plate of the
        // canary assembly, an own printed part (PLA) with two bosses as stand-offs for the canary board,
        // each with a hole for an M3 heat-set insert (M3 x 5.7, hole 4.0 mm). It takes its dimensions
        // from the assembly's skeleton (task 5.24). ME-PART stays owned by the FreeCAD file
        // (XD-ADR-0128); the short name is a reference to it, so the model can count its usages.
        part def <'ME-PART-0001'> CanaryPart;

        // A standard fastener of the local library lib/iso7380-1-m3x6.FCStd: button head screw
        // ISO 7380-1 M3x6, A2 (Standard property). It holds the canary board on a boss of the base
        // plate: 1.6 mm board plus 4.4 mm in the insert.
        part def <'ME-PART-0002'> ButtonHeadScrewM3x6;

        // The mounting interface of the canary assembly: an LCS with Port = this ID in the
        // skeleton (XD-ADR-0133). It conforms to no SYS-IF (allowed for ports).
        port def <'ME-PORT-0001'> CanaryMount :> MechanicalPort {
            doc /* Two holes in the bottom face of the base plate (the canary part), 12 mm apart. */
            attribute holeSpacing = 12 [mm];
        }

        // The seat of the canary board (task 5.28, XD-ADR-0134): it conforms to the board's space
        // budget CanaryBoardSpace (SYS-IF) of the system model. It takes over the budget values that
        // drive FreeCAD: through `curatrix gen freecad-params` they become boardSeat_<attribute> in
        // Params, the sketch BoardOutline of the skeleton follows them, and the KiCad StepUp push
        // writes that sketch (outline and holes) into the KiCad board. The values are copies of the
        // budget, so they do not count toward the ten parameters; change them only together with
        // the budget, on one branch (co-design change).
        port def <'ME-PORT-0002'> CanaryBoardSeat :> RobArmProduct::Canary::CanaryBoardSpace, MechanicalPort {
            doc /* Outline and mounting holes of the canary board, in the board frame. */
            :>> width = 30 [mm];
            :>> depth = 20 [mm];
            :>> holeDiameter = 3.2 [mm];
            :>> hole1X = 4 [mm];
            :>> hole1Y = 4 [mm];
            :>> hole2X = 24 [mm];
            :>> hole2Y = 16 [mm];
        }

        // The canary assembly realizes the canary unit: the base plate (canary part) with the board
        // seat, and two screws that hold the board on the plate's bosses. Its top document has one
        // FreeCAD link per usage (CK-F15, XD-ADR-0138): the plate once, the screw twice.
        // Its parameters (XD-ADR-0137) reach FreeCAD through `curatrix gen freecad-params`: the
        // aliases canaryPart_length, canaryPart_thickness, mount_*, and boardSeat_* in the
        // spreadsheet Params of canary-assembly-skeleton.FCStd. The master sketch derives the plate
        // layout from them in the assembly frame: plate length, plate width (board depth plus twice
        // the seat's y offset, so the margin around the board is the same on both sides), plate
        // thickness, the boss positions (seat placement plus the budget's hole positions) and the
        // boss height (seat z minus 1.6 mm board minus the plate thickness: 3.4 mm, more than the
        // 1.4 mm the budget's heightBelow leaves for the board's bottom-side parts). The part takes
        // its dimensions from the master sketch, the LCS their positions from Params (CK-F3).
        part def <'ME-ASM-0001'> CanaryAssembly :> RobArmProduct::Canary::CanaryUnit, Assembly {
            doc /* The canary assembly: the base plate with two stand-offs, the board seat, two screws. */
            part canaryPart : CanaryPart {
                attribute length = 40 [mm] { @ModelMatchTolerance { value = 0.01; } }  // model-to-CAD agreement, not a print tolerance
                attribute thickness = 3 [mm] { @ModelMatchTolerance { value = 0.01; } }
            }
            part boardScrew : ButtonHeadScrewM3x6 [2];
            // the mount sits in the middle of the plate's bottom face
            port mount : CanaryMount {
                :>> x = 20 [mm];
                :>> y = 15 [mm];
                :>> z = 0 [mm];
            }
            // the board frame in the assembly (LCS_boardSeat in the skeleton): 5 mm in from the plate's
            // edges, the board's top face at z = 8 mm, so its bottom face (1.6 mm board) lies on the
            // bosses (top at 6.4 mm); the budget box ends heightBelow = 3 mm under the top face (z = 5 mm),
            // above the plate's top face (z = 3 mm)
            port boardSeat : CanaryBoardSeat {
                :>> x = 5 [mm];
                :>> y = 5 [mm];
                :>> z = 8 [mm];
            }
        }
    }
}
