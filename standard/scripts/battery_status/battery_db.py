import sqlite3


def create_connection():
    try:
        con = sqlite3.connect('test.db')
        print(sqlite3.version)
        print('OK!')
    except sqlite3.Error as e:
        print('something failed:', e)


if __name__ == '__main__':
    create_connection()
