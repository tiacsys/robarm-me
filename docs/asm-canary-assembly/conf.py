# Sphinx configuration of the assembly document "Canary Assembly" (asm-canary-assembly), made by
# `curatrix new asm` from xdmod/templates/freecad-asm/doc/ (ME-4). The shared XDMOD setup
# (xdmod/sphinx/xdmod_conf.py) wraps zdocs' configure() and loads the XDMOD Sphinx extension.
import os
import sys
from pathlib import Path

sys.path.insert(0, str(Path(os.environ["ZDOCS_WEST_TOPDIR"]) / "xdmod" / "sphinx"))
from xdmod_conf import configure, repo_root  # noqa: E402

REPO = repo_root(__file__)
configure(globals(), __file__, "Canary Assembly",
          generated=[(REPO, "generated/*.json")])
