# Game Finder

Command line tool for finding games and seeing related metadata

## Installation
Theres a number of options for installation

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

## Setup
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
```
$ game-finder search Borderlands 2
Name: Borderlands 2
Platforms: Mac, Xbox 360, PlayStation 3, PlayStation Network (PS3), PC, Android, PlayStation Vita, PlayStation Network (Vita), Linux
Release: 2012-09-18

Name: Borderlands
Platforms: Mac, Xbox 360, PlayStation 3, PC
Release: 2009-10-20

Name: Borderlands Legends
Platforms: iPhone, iPad
Release: 2012-10-31

Name: Borderlands: The Pre-Sequel!
Platforms: Mac, Xbox 360, PlayStation 3, PlayStation Network (PS3), PC, Android, Linux
Release: 2014-10-14

Name: Borderlands: The Handsome Collection
Platforms: Xbox One, PlayStation 4
Release: 2015-03-24

Name: Borderlands 3 (Working Title)

Name: Tales from the Borderlands
Platforms: Mac, Xbox 360 Games Store, PC, iPhone, iPad, Android, Xbox One, PlayStation 4
Release: 2014-11-25

Name: Hugo 2 1/2
Platforms: Game Boy Color
Release: 1999-12-31

Name: 2 Hot 2 Handle
Platforms: ZX Spectrum
Release: 1991-12-31

Name: Roundball: 2-on-2 Challenge
Platforms: Nintendo Entertainment System
Release: 1992-05-31
```

#### `game-finder info`
```
$ game-finder info Borderlands 2
Name: Borderlands 2
Platforms: Mac, Xbox 360, PlayStation 3, PlayStation Network (PS3), PC, Android, PlayStation Vita, PlayStation Network (Vita), Linux
Released: 2012-09-18
Genres: Role-Playing, First-Person Shooter
Developers: Gearbox Software LLC
DLCs:\nBorderlands 2: Mechromancer
Captain Scarlett and Her Pirate's Booty
Season Pass
Mister Torgue's Campaign of Carnage
Sir Hammerlock's Big Game Hunt
Tiny Tina’s Assault on Dragon Keep
Psycho Pack
```

## Tests
To execute tests `rake test` individual test types are available under `rake test:unit` or `rake test:lint`

## Packaging

### Travelling Ruby
To package using travelling ruby run `rake package`
Invidvidual architectures are available under
- `rake package:linux:x86`
- `rake package:linux:x86_64`
- `rake package:osx`

### Gem
To build a game `rake build:gem`
