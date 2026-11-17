// Views of the ME model. `curatrix views build robarm-me` renders them into views/; the
// documents me-design and asm-canary-assembly embed them with `sysml-view` (tiacsys/xdmod#69,
// findings 3, 4 and 13).
// SPDX-License-Identifier: Apache-2.0
package RobArmMeViews {
    private import XdTrace::*;

    // The canary assembly: its parts (decomposition) and its ports, the mount and the seat of
    // the canary board (interconnection).
    view canaryAssemblyParts {
        @XdView { kind = "decomposition"; root = "RobArmMe::Canary::CanaryAssembly"; }
    }
    view canaryAssembly {
        @XdView { kind = "interconnection"; root = "RobArmMe::Canary::CanaryAssembly"; }
    }

    // How the ME model refines the system model: the assembly realizes a system element, the
    // board seat conforms to the board's space budget (XD-ADR-0132, XD-ADR-0134).
    view meAllocation {
        @XdView { kind = "allocation"; root = "RobArmMe::Canary"; }
    }
}
