#!/usr/bin/env python
# coding: utf-8
import time, os, stat,re, sys

BASE_DIR = sys.argv[1]

def listfiles(folder):
    for root, folders, files in os.walk(folder):
        for filename in folders + files:
            yield os.path.join(root, filename)
            
def file_age_in_seconds(pathname):
    return time.time() - os.stat(pathname)[stat.ST_MTIME]


def convert_to_seconds(value, unit):
    if unit == 'd':
        multi = 24*60*60
    elif unit == 'h':
        multi = 60*60
    elif unit == 'm':
        multi = 60
    elif unit == 's':
        multi = 1
    else:
        raise "something is wrong"
    
    return multi * int(value)



all_dir =  os.listdir(BASE_DIR)

regex = r"_(\d+)(d|h|m|s)$"

for test_str in all_dir:
    match = re.search(regex, test_str, re.MULTILINE)
    if match:
        value = match.group(1)
        unit = match.group(2)
        limit = convert_to_seconds(value, unit)

        
        match_path = os.path.join(BASE_DIR, test_str)
        
        largest = limit - file_age_in_seconds(match_path)
        
        for filename in listfiles(match_path):
            next_ = limit - file_age_in_seconds(filename)
            if  next_ > largest:
                largest = next_
        if largest < 0:
            try:
                print(f'Deleting {match_path}')
                os.rmdir(match_path)
            except OSError as e:
                print("Error: %s : %s" % (match_path, e.strerror))
