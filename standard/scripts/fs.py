#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import tkinter as tk
import random

COLORS = [
        'white smoke', 'gainsboro', 'floral white', 'old lace',
        'linen', 'antique white', 'papaya whip', 'blanched almond', 'bisque', 'peach puff',
        'navajo white', 'lemon chiffon', 'mint cream', 'azure', 'alice blue', 'lavender',
        'lavender blush', 'misty rose', 'dark slate gray', 'dim gray', 'slate gray',
        'light slate gray', 'gray', 'light grey', 'midnight blue', 'navy', 'cornflower blue', 'dark slate blue',
        'slate blue', 'medium slate blue', 'light slate blue', 'medium blue', 'royal blue',  'blue',
        'dodger blue', 'deep sky blue', 'sky blue', 'light sky blue', 'steel blue', 'light steel blue',
        'light blue', 'powder blue', 'pale turquoise', 'dark turquoise', 'medium turquoise', 'turquoise',
        'cyan', 'light cyan', 'cadet blue', 'medium aquamarine', 'aquamarine', 'dark green', 'dark olive green',
        'dark sea green', 'sea green', 'medium sea green', 'light sea green', 'pale green', 'spring green',
        'lawn green', 'medium spring green', 'green yellow', 'lime green', 'yellow green',
        'forest green', 'olive drab', 'dark khaki', 'khaki', 'pale goldenrod', 'light goldenrod yellow',
        'light yellow', 'yellow', 'gold', 'light goldenrod', 'goldenrod', 'dark goldenrod', 'rosy brown',
        'indian red', 'saddle brown', 'sandy brown',
        'dark salmon', 'salmon', 'light salmon', 'orange', 'dark orange',
        'coral', 'light coral', 'tomato', 'orange red', 'red', 'hot pink', 'deep pink', 'pink', 'light pink',
        'pale violet red', 'maroon', 'medium violet red', 'violet red',
        'medium orchid', 'dark orchid', 'dark violet', 'blue violet', 'purple', 'medium purple',
        'thistle', 'snow2', 'snow3']


class FullScreenApp(object):
    def __init__(self, master, **kwargs):
        self.master = master
        pad = 3
        self._geom = '200x200+0+0'
        master.geometry("{0}x{1}+0+0".format(
            master.winfo_screenwidth()-pad, master.winfo_screenheight()-pad))
        master.bind('<Escape>', self.toggle_geom)
        master.bind('a', self.toggle_color)
        master.bind('b', self.toggle_color)
        master.bind('c', self.toggle_color)
        master.bind('d', self.toggle_color)
        master.bind('e', self.toggle_color)
        master.bind('f', self.toggle_color)
        master.bind('g', self.toggle_color)
        master.bind('h', self.toggle_color)
        master.bind('i', self.toggle_color)
        master.bind('j', self.toggle_color)
        master.bind('k', self.toggle_color)
        master.bind('l', self.toggle_color)
        master.bind('m', self.toggle_color)
        master.bind('n', self.toggle_color)
        master.bind('o', self.toggle_color)
        master.bind('p', self.toggle_color)
        master.bind('q', self.toggle_color)
        master.bind('r', self.toggle_color)
        master.bind('s', self.toggle_color)
        master.bind('t', self.toggle_color)
        master.bind('w', self.toggle_color)
        master.bind('x', self.toggle_color)
        master.bind('y', self.toggle_color)
        master.bind('z', self.toggle_color)
        master.bind('<Control-q>', self.quit)

    def toggle_geom(self, event):
        geom = self.master.winfo_geometry()
        print(geom, self._geom)
        self.master.geometry(self._geom)
        self._geom = geom

    def toggle_color(self, event):
        color = random.choice(COLORS)
        self.master.configure(background=color)

    def quit(self, event):
        exit()

if __name__ == '__main__':
    root = tk.Tk()
    app = FullScreenApp(root)
    root.mainloop()
