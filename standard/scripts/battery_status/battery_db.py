import sqlite3


def create_database():
    try:
        conn = sqlite3.connect(':memory:')
        c = conn.cursor()
        c.execute('''
                CREATE TABLE BATTERY (
                serial VARCHAR(20) PRIMARY KEY,
                model VARCHAR(20),
                technology VARCHAR(20),
                manufacturer VARCHAR(20),
                voltage_min_design INT,
                energy_full_design INT);
                ''')
        c.execute('''
                CREATE TABLE STATUS (
                voltage_now INT,
                condition VARCHAR(20),
                state VARCHAR(20),
                capacity INT,
                power_alarm INT,
                energy_now INT,
                energy_full INT,
                power_now INT,
                serial VARCHAR(20) REFERENCES BATTERY(serial),
                time REAL);
                ''')
        print(sqlite3.version)
        print('OK!')
    except sqlite3.Error as e:
        print('something failed:', e)


if __name__ == '__main__':
    create_database()
