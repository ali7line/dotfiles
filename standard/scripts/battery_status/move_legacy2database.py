import ast
import sqlite3

LOG_NAME = 'battery.log'
DATABASE = 'battary.db'

with open(LOG_NAME, 'r') as f:
    for line in f.readlines():
        data_dict = ast.literal_eval(line.strip())
        # input data into database file
