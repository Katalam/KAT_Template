import os, shutil, sys, subprocess

if sys.version_info[0] == 2:
    print("Python 3 is required.")
    sys.exit(1)

cwd = os.path.dirname(os.path.realpath(__file__))
projectpath = cwd + os.path.sep + '..'

src_txt = input("Source directory: ")
missionspath = os.path.abspath(os.path.join(projectpath, src_txt))
scriptcomponentpath = os.path.abspath(os.path.join(missionspath, "script_component.hpp"))

print("Making...")
releasepath = os.path.join(os.path.dirname(missionspath), "release")
if not os.path.isdir(releasepath):
    os.makedirs(releasepath)

def getVersion():
    with open(scriptcomponentpath) as load:
        for line in load:
            line = line.rstrip()
            if "MISSIONVERSION" in line:
                split = line.split()
                version = (split[-1])
                return version

if (getVersion() is not None):
    try:
        command = 'armake2.exe pack -v "' + missionspath + '" "{}\\{}_v{}.pbo"'.format(releasepath, src_txt, getVersion())
        subprocess.check_output(command, shell=True)
    except:
        print("Failed to make {}.".format(src_txt))
    else:
        print("Successfully made {}.".format(src_txt))
else:
    print("Failed to find version number")
