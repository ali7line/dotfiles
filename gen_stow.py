from shutil import which
import os

def stow(dir_):
    print('\t* Stowing' ,dir_)
    return 'stow {}\n'.format(dir_)

def version_stow(dir_):
    versions = next(os.walk(dir_))[1]
    print('\t* Which one?')
    for i, version in enumerate(versions):
        print('\t ({}): {}'.format(i, version))

    user_input = int(input())
    user_choice = versions[user_input]
    print('\t* Stowing', user_choice)

    return 'stow -d {} -t $HOME {}\n'.format(dir_, user_choice)



class DotApp:
    def __init__(self, dir_):
        self.app_name = self.clean_name(dir_)
        self.address = dir_
        self.installed = which(self.app_name)
        self.versions = None # get dotfile versions

    def find_dotfile_versions(self):
        pass

    def find_installed_version(self):
        pass



def gather_dotfile_info():
    info = {}
    # list of dotfiles 
    all_dir = next(os.walk('.'))[1]
    for dir_ in all_dir:
        if dir_.startswith('.'):
            continue
        elif dir_.endswith('-'):
            # has multiversion
            app_name = dir_[:-1]
            versions = get_dotfile_versions(dir_)
            installed = which(app_name)
            app_info = {
                    'address': dir_,
                    'versions': versions,
                    'installed': installed,
                    }
        else:
            app_name = dir_
            installed = which(app_name)
            app_info = {
                    'address': dir_,
                    'versions': None,
                    'installed': installed,
                    }



if __name__ == '__main__':
    with open('stow_all.bash', 'wt') as f:
        all_dir = next(os.walk('./apps'))[1]
        all_dir.sort()
        f.write('#!/bin/bash\n')
        f.write('stow standard\n')

        for dir_ in all_dir:
            # ignores .git
            if dir_.startswith('.'):
                continue

            f.write(version_stow(os.path.join('./apps', dir_)))
