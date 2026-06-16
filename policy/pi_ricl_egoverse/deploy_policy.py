"""RoboTwin deploy shim for the EgoVerse PIRicl (pi0.5) policy.

Thin re-export — all logic lives in ``egomimic.ricl.robotwin_policy`` (versioned in the
EgoVerse repo, beside the adapter glue + unit tests). This file is just the
RoboTwin-contract layer the eval driver imports (``get_model`` / ``eval`` /
``reset_model`` / ``encode_obs``); it lives in the GaTech-RL2/RoboTwin fork so
``git submodule update --init`` brings it. Runs under RoboTwin's SAPIEN eval with the
EgoVerse torch env + DINOv2 + the trained checkpoint on PYTHONPATH.
"""

from egomimic.ricl.robotwin_policy import encode_obs, eval, get_model, reset_model

__all__ = ["encode_obs", "eval", "get_model", "reset_model"]
