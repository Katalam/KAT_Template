import os, shutil, sys

if sys.version_info[0] == 2:
    print("Python 3 is required.")
    sys.exit(1)

scriptpath = os.path.realpath(__file__)
location = os.path.dirname(os.path.dirname(scriptpath))

# location = os.path.join(os.path.expanduser('~'), 'Documents')
# location_test = os.path.join(location, 'Arma 3 - Other Profiles')
# if os.path.isdir(location_test):
#    location = location_test
# else:
#    location = os.path.join(location, 'Arma 3')

for root, dirs, files in os.walk(location):
    path = os.path.splitdrive(root)
    for name in dirs:
        if 'kat_ttt_template.malden'.lower() in name:
            full_path = os.path.join(os.path.join(*path), name)

root_src_dir = full_path
root_dst_dir = root_src_dir[:-19]

src_txt = input("Destination directory: ")

dst_dir_test = os.path.join(root_dst_dir, src_txt)
if os.path.isdir(dst_dir_test):
    root_dst_dir = dst_dir_test
    print("Copying files to: ", src_txt)
else:
    print("Enter valid path")
    print(dst_dir_test)
    sys.exit(1)

for src_dir, dirs, files in os.walk(root_src_dir):
    dst_dir = src_dir.replace(root_src_dir, root_dst_dir, 1)
    if not os.path.exists(dst_dir):
        os.makedirs(dst_dir)
    for file_ in files:
        src_file = os.path.join(src_dir, file_)
        dst_file = os.path.join(dst_dir, file_)
        if os.path.exists(dst_file):
            os.remove(dst_file)
        if not dst_file.endswith(('.sqm', '.txt', '.psd', '.png')):
            shutil.copy(src_file, dst_dir)
