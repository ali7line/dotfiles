import os

def stow(dir_):
    print('\t* Stowing' ,dir_)
    return 'stow {}'.format(dir_)

def version_stow(dir_):
    versions = next(os.walk(dir_))[1]
    print('\t* Which one?')
    for i, version in enumerate(versions):
        print('\t ({}): {}'.format(i, version))

    user_input = int(input())
    user_choice = versions[user_input]
    print('\t* Stowing', user_choice)

    return 'stow -d {} -t $HOME {}'.format(dir_, user_choice)
    

with open('stow_all.bash', 'wt') as f:
    f.write('#!/bin/bash\n')
    all_dir = next(os.walk('.'))[1]

    for dir_ in all_dir:
        # ignores .git
        if dir_.startswith('.'):
            continue

        print(dir_)
        if dir_.endswith('-'):
            # dir with different versions of config
            f.write(version_stow(dir_))
        else:
            f.write(stow(dir_))
