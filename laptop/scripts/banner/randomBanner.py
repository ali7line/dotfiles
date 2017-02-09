#!/usr/bin/python2

import os
import random
import re
import types

fileList = []
bannerRegex = re.compile(r'\.sh$')
where_am_i = os.path.dirname(os.path.realpath(__file__))
for f in os.listdir(where_am_i):
    mo = re.search(bannerRegex, f)
    if type(mo) is not types.NoneType:
        fileList.append(mo.string)

print(where_am_i+'/'+random.choice(fileList))
