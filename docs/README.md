<p align="center">
    <img src="https://raw.githubusercontent.com/Katalam/kat_10thmods/master/logo.png">
</p>

<p align="center">
    <a href="https://github.com/Katalam/kat_10thmods/releases/latest">
        <img src="https://img.shields.io/badge/Version-1.1.5-blue.svg?style=flat-square" alt="KAT 10thMods Version">
    </a>
    <a href="https://github.com/Katalam/kat_10thmods/issues">
        <img src="https://img.shields.io/github/issues-raw/Katalam/kat_10thmods.svg?style=flat-square&label=Issues" alt="KAT 10thMods Issues">
    </a>
    <a href="https://github.com/Katalam/kat_10thmods/releases">
        <img src="https://img.shields.io/github/downloads/Katalam/kat_10thmods/total.svg?style=flat-square&label=Downloads" alt="KAT 10thMods Downloads">
    </a>
    <a href="https://ci.appveyor.com/project/Katalam/kat-10thmods">
        <img src="https://ci.appveyor.com/api/projects/status/aq2ihs6ri50c5k12?svg=true" alt="KAT 10thMods Build Status">
    </a>
</p>

<p align="center">
    <sup><strong>Requires the latest version of <a href="https://github.com/CBATeam/CBA_A3/releases">CBA A3</a>.<br/>
    Visit me on <a href="https://discord.gg/HbA93HK">Discord</a></strong></sup>
</p>


*Created by Katalam*

## Contributing

You can help out with the ongoing development by looking for potential bugs in my code base, or by contributing new features. I am always welcome to new pull requests containing bug fixes, refactors and new features.

### Building
The build process is base on the [HEMTT build process](https://synixebrett.github.io/HEMTT/#/), so you can follow the steps there. Basically the following is needed:
+ correctly setup project drive (P: drive)
+ download/clone kat_10thmods GitHub repo
+ right-click in the root folder and open power shell
+ you can build by executing ```.\hemtt build``` from the tools folder
+ you have to setup the data link with admin cmd: mklink /J "A:\SteamLibrary\steamapps\common\Arma 3\z\kat_10thmods" "P:\kat_10thmods"
+ for testing include your mod by adding ```-mod=x\kat_10thmods``` as start parameter

For building release builds see [ACE3 reference](https://ace3mod.com/wiki/development/setting-up-the-development-environment.html).

## Using HEMTT

HEMTT is a CLI tool that must be called from the root of your project. HEMTT needs to be placed in the project root and called with `./hemtt` on Linux or `hemtt.exe` on Windows. You can install HEMTT system wide on Windows by using `setup.exe` in the download.

Below is just a showcase, read the [documentation](https://synixebrett.github.io/HEMTT) to learn about more features and reasonings.

### Submitting issues and requesting features

Please, use my [Issue Tracker](https://github.com/Katalam/kat_10thmods/issues) to report a bug, propose a feature, or suggest changes to the existing ones.

## License

kat_10thmods is licensed under the GNU General Public License ([GPLv3](https://github.com/Katalam/kat_10thmods/blob/master/LICENSE)).
