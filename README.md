# Game Finder

Command line tool for finding games and seeing related metadata

![Travis CI](https://travis-ci.org/ctompkinson/game-finder.svg?branch=master)

## Example Workflow
```
game-finder search borderlands
game-finder info Borderlands 2
```

## Installation

#### Pre-Packaged
1. Download latest releases zip file for your architecture
2. Extract to an installation directory e.g. `/opt/game-finder`
3. Symlink to your path `ln -s /opt/game-finder/game-finder /usr/local/bin/game-finder`

#### Gem
- `gem install game-finder`

#### Using repository
1. Install Ruby
2. `rake install`
3. `ln -s $GIT_REPO/bin/game-finder /usr/local/bin/game-finder`

#### Setup
1. Setup an account at (Giant Bomb)[https://auth.giantbomb.com/signup/]
2. Copy your API access key from there (API)[https://www.giantbomb.com/api/]
3. Run game-finder to install a default config file
4. Update your config at `~/.game-finder.yaml` changing `api_key` to your key e.g.

```
---
api_key: 0000
```

## Commands

#### `game-finder search`


#### `game-finder info`
