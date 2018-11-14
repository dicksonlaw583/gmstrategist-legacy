# GMStrategist (Legacy): AI Toolkit for GameMaker Studio 1.4

## Overview

GMStrategist is an open-source library that aims to implement common AI algorithms for GameMaker Studio. This facilitates the development of puzzle, board game and other turn-based AIs.

## Currently Supported Algorithms:

- [**MCTS**](https://en.wikipedia.org/wiki/Monte_Carlo_tree_search): A highly configurable and flexible tree-search algorithm capable of general gameplay. This method is best suited for new games without established theory and/or an obvious means of valuation.
- [**Minimax**](https://en.wikipedia.org/wiki/Minimax): The classic heuristic tree-search algorithm. This method is best suited for games with established theory or an obvious means of valuation.

## Requirements

- GameMaker Studio 1.4.1804 or 1.4.9999

## Installation

- Download `GMStrategist_Legacy.gmez` from the Releases page.
- In GMS 1.4, right-click on Extensions, then select Import Extension.
- Select `GMStrategist_Legacy.gmez` and confirm.

## Known Issues

- **Legacy only:** There is no plan to convert the script resources to internal extension functions. 1.4.9999 contains an unresolved bug where script IDs for extension functions are not aligned properly and `script_execute()` would run the wrong function.

## Contributing to GMStrategist

GMStrategist welcomes pull requests for bug fixes and additional general algorithms.

- Clone this repository.
- Open the project in GameMaker Studio and make your additions/changes as a sub-group in the `GMStrategist` group (essential scripts and objects only).
- Export the entire `GMStrategist` group (essential scripts and objects only) to the GMStrategist extension.
- Open a pull request.

In order to ensure general interoperability, please **work in local scope whenever possible**, and minimize all use of instance and global scopes.