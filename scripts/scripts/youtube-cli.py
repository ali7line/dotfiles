#!/usr/bin/env python
# -*- coding: utf-8 -*-
from bs4 import BeautifulSoup
from urllib.request import urlopen
import sys

def create_search_query(args):
    head = "http://www.youtube.com/results?search_query="
    tail = ""
    for q in args:
        tail += q + "+"
    return head + tail[:-1]


if __name__ == '__main__':
    if len(sys.argv) > 1:
        search_url = create_search_query(sys.argv[1:]) 
    else:
        raise "no search query specifiled"

    print('seraching:', search_url)
    print('-----------------------')

    html = urlopen(search_url)
    bObj = BeautifulSoup(html.read(), 'html.parser')
    all_titles = bObj.find('ol', class_='item-section')
    title_list = all_titles.find_all('li', recursive=False)
    print('found: ', len(title_list) , 'videos')
    print("")
    for title in title_list:
        try:
            print(title.find('h3', class_='yt-lockup-title').text)
        except AttributeError as e:
            print('some error')
