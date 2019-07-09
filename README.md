<p align="center">
    <img src="https://raw.githubusercontent.com/Katalam/KAT_template/master/logo.png">
</p>

<p align="center">
    <a href="https://github.com/Katalam/KAT_template/releases/latest">
        <img src="https://img.shields.io/badge/Version-2.0.10-blue.svg?style=flat-square" alt="KAT Template Version">
    </a>
    <a href="https://github.com/Katalam/KAT_template/issues">
        <img src="https://img.shields.io/github/issues-raw/Katalam/KAT_Template.svg?style=flat-square&label=Issues" alt="KAT 10thMods Issues">
    </a>
    <a href="CONTRIBUTING">
        <img src="https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg" alt="Contributor Covenant">
    </a>
</p>
<p align="center">
    <sup><strong>Requires the latest version of <a href="https://github.com/CBATeam/CBA_A3/releases">CBA A3</a>.<br/>
    Visit me on <a href="https://discord.gg/HbA93HK">Discord</a></strong></sup>
</p>


# KAT_Template

Arma 3 is a sandbox game. Everyone is playing it on a different way. But I want to build in technical terms the same missions. A template will set up the things you need in every mission. The Loadout changer, the teleporter for technical issues, a vehicle spawner. Also the MACRO stuff has to be prepared. The git will contain the latest version of the template and some missions I build.

## Getting started

To understand the code you have to start with this: [ACE Coding Guidelines](https://ace3mod.com/wiki/development/coding-guidelines.html) and continue here [Schedular and our Pratices](https://ace3mod.com/wiki/development/arma-3-scheduler-and-our-practices.html)
Every not CBA Macro is defined here: [Script Component](https://github.com/Katalam/KAT_template/blob/master/kat_template.malden/script_component.hpp)
All Loadouts Macros are here: [Script Component](https://github.com/Katalam/KAT_template/blob/master/kat_template.malden/functions/loadouts/script_component.hpp)

Every description.ext config class is defined in a extra file. The #include macros will combine it to one file but for better overview it is seperated.
This is a template for your own mission. So you have to delete everything you don't need.
Mission folders have to be as small as possible. Every sound and picture have to minimised in size and length.
For example the .psd and .png file for the unflip vehicle action don't need to be in your own mission. Or if you wanna play a german army mission, the unit insignias for the us army aren't needed.

## Deployment

* Simply move the mission folder in your arma 3 mission folder
* Example: `C:\Users\<USER>\Documents\Arma 3 - Other Profiles\<YOURPROFILE>\mpmissions`
* Start game - Multiplayer
* Host Server and select mission file

## Built With

* [CBA_A3](https://github.com/CBATeam/CBA_A3) - Community Based Addons for Arma 3 needs to be installed for MACRO usage

## Contributing

You can help out with the ongoing development by looking for potential bugs in my code base, or by contributing new features. I am always welcome to new pull requests containing bug fixes, refactors and new features.
Please read [CONTRIBUTING](CONTRIBUTING) for details on our code of conduct, and the process for submitting pull requests to us.

## Issues

Please, use my [Issue Tracker](https://github.com/Katalam/KAT_template/issues) to report a bug, propose a feature, or suggest changes to the existing ones.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/Katalam/KAT_template/tags).

## Authors

- **Katalam** - *Initial work*
- **Sinus** - *Initial work*

<!---
See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.
-->


## License

This project is licensed under the GPLv3 License - see the [LICENSE](LICENSE) file for details
