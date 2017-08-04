#!/usr/bin/env python
# -*- coding: utf-8 -*-
from multiprocessing.dummy import Pool as ThreadPool
import os
import re
import sys
import subprocess
from glob import glob

def list_types(types, path):
    result = []
    for ext in types:
        result.extend([y for x in os.walk(path) for y in glob(os.path.join(x[0], ext))])

    return result

def convert_file(command):
    subprocess.Popen( command, shell=True).wait()


## strip text after year
## rename file with without text after year and same extention
if __name__ == '__main__':
    commands = []
    path = os.environ.get('PWD')
    if not path:
        raise "PWD environment variable not found"

    types = ('*.mp4','*.avi','*.mkv')
    result = list_types(types, path)
    
    for r in result:
        mo = re.search(r'^(.*)(\d{4})(.*)(\.\w{3})$', r)
        if mo:
            full_path = mo.group(0)
            head = mo.group(1)
            year = mo.group(2)
            ext = mo.group(4)
            ext = '.mp3'
            #print(full_path, 'into', head+year+ext)
            #print(head+ext)
            #subprocess.Popen('ffmpeg -i {} -vn -c:a libmp3lame -y {}{}{}').wait()
            commands.append( 'ffmpeg -i {} -vn -c:a libmp3lame -y {}{}{}'.format(
                        full_path, head, year, ext))
        else:
            print('no match found for:' , r)

    pool = ThreadPool(3)
    pool.map(convert_file, commands)

    pool.close()
    pool.join()
